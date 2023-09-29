-- Pandoc filter to process code blocks with class "kroki" containing
-- Diagram code dfor the kroki webservice
-- see https://kroki.io and https://niolesk.top

local function mkdir (path)
    --  fspath does not exists on pandoc lua
    local command = "python3 -c 'import os;\nif not(os.path.exists(\"" .. path .. "\")): os.mkdir(\"" .. path .. "\");'"
    local handle = io.popen(command)
    local result = handle:read("*a")
    handle:close()
    return(result)
end
local function compress(text)
    -- I am sorry but pandoc lua has neither base64 support nor zlib support
    -- let's use a Python one-liner
    -- print(base64.urlsafe_b64encode(zlib.compress("test".encode())).decode("ascii"))'
    local command ="python3 -c 'import base64, zlib; print(base64.urlsafe_b64encode(zlib.compress(\"\"\"" .. text .. "\"\"\".encode(), 9)).decode(\"ascii\"),end=\"\")'"
    --local command ="python3 -c \"import base64, zlib; print(base64.urlsafe_b64encode(zlib.compress(\"\"\"" .. text .. "\"\"\".encode(), 9)).decode(\"ascii\"),end=\"\")'"
    local handle = io.popen(command)
    local result = handle:read("*a")
    handle:close()
    return(result)
end

-- not sure if thi this works
-- crc32, could replace the Python code
function crc(text)
    local str = text
    local t = {}
    for i = 1, #str do
        t[i] = str:byte(i)
    end
    local buf = t
    local size = #str
    local crc = 0xFFFFFFFF
    local table = {}
    local rem, c
    local res  = ""
    -- calculate CRC-table
    for i = 0, 0xFF do
        rem = i
        for j = 1, 8 do
            if (rem & 1 == 1) then
                rem = rem >> 1
                rem = rem ~ 0xEDB88320
            else
                rem = rem >> 1
            end
        end
        table[i] = rem
    end

    for x = 1, size do
        c = buf[x]
        crc = (crc >> 8) ~ table[(crc & 0xFF) ~ c]
    end
    crc = crc ~ 0xFFFFFFFF
    res = string.format("0x%x",crc)
    return res
end


function crc32 (text)
    local command = "python3 -c \"import zlib;print(hex(zlib.crc32(b'" .. text .. "') & 0xffffffff),end='')\""
    local handle = io.popen(command)
    local result = handle:read("*a")
    handle:close()
    return(result)
end

local function exists(name)
    if type(name)~="string" then return false end
    return os.rename(name,name) and true or false
end
local function download (url,filename)
    command = "python3 -c \"import requests; r=requests.get('" .. url .. "');fout=open('" .. filename .. "','wb'); fout.write(r.content);fout.close(); print('done');\""
    local handle = io.popen(command)
    local result = handle:read("*a")
    handle:close()
    return(result)
end


-- Print contents of `tbl`, with indentation.
-- `indent` sets the initial level of indentation.
local function tprint (tbl, indent)
  if not indent then indent = 0 end
  for k, v in pairs(tbl) do
    formatting = string.rep("  ", indent) .. k .. ": "
    if type(v) == "table" then
      print(formatting)
      tprint(v, indent+1)
    elseif type(v) == 'boolean' then
      print(formatting .. tostring(v))      
    else
      print(formatting .. v)
    end
  end
end
local cache = "false"
local ext = "svg"
local dia = "plantuml"
local fig_path = "images"
local fig_prefix = "kroki"
local echo = "true"

function Meta (meta)
    if meta.kroki then
        cache = meta.kroki.cache or "false"
        ext  = meta.kroki.ext  or "svg"
        dia  = meta.kroki.dia  or "plantuml"
        fig_path = meta.kroki.fig_path  or "images"
        fig_prefix = meta.kroki.fig_prefix or "kroki"
        echo  = meta.kroki.echo  or "true"
        return meta
    end
    return Nil
end

function CodeBlock(block)
    if block.classes[1] == "kroki" then
        local ext = block.attributes.ext or ext 
        local dia = block.attributes.dia or dia
        dia       = string.lower(dia)
        local echo = block.attributes.echo or echo
        local cache = block.attributes.cache or cache
        local caption = block.attributes.caption or ""        
        local title = block.attributes.title or "" 
        local fig_path = block.attributes.fig_path or fig_path
        local fig_prefix = block.attributes.fig_prefix or fig_prefix
        if type(ext) == "table" then
            ext=ext[1]['text']
        end
        local URL = "https://kroki.io/" .. dia .."/" .. ext .."/" .. compress(block.text)
        local img_attr = {
            id = block.identifier,
            name = block.attributes.name,
            width = block.attributes.width,
            height = block.attributes.height
        }
        if cache == "true" then
            mkdir(fig_path)
            crc=crc32(URL)
            -- print(URL)
            imgfile=fig_path .. "/" .. fig_prefix .. "-" .. crc .. "." .. ext
            if not (exists(imgfile)) then
                download(URL,imgfile)
            end
            URL = imgfile
        end    
        local img_obj = pandoc.Image(caption, URL, title, img_attr)
        if (string.lower(echo) == "true") then
            return {block,pandoc.Para{ img_obj }}
        else
            return {pandoc.Para{ img_obj }}
        end
    end
end


-- Execute Meta first.
return {
    {Meta = Meta},
    {CodeBlock = CodeBlock},
}
