
--[[
filter-code-title.lua: lua script to add CSS and Vanilla Javascript to native Pandoc HTML output
Adds a title to the code block if the pre block or the div block around has a title attribute

Copyright © 2021 Michael Cysouw <cysouw@mac.com> (toc-css)
Copyright © 2023 Detlef Groth <detlef (at) dgroth (dot) de>

Permission to use, copy, modify, and/or distribute this software for any
purpose with or without fee is hereby granted, provided that the above
copyright notice and this permission notice appear in all copies.
THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
]]

css = [[ 
<!-- CSS added by filter 'filter-code-title.lua' to add title block above code blocks -->
<style>
.code-title {
    display: inline-block;
    padding: 5px 8px;
    background-color: #E7E9EB;
    color: #485A60;
    font-size: 90%;
    font-weight: 400;
}
</style>
]]

-----------------------------

script = [[
<!-- Javascript added by 'filter-code-title' to add title block above source code -->
<script>
window.onload = function () {
     let srccode= document.body.getElementsByClassName("sourceCode");
     let j = srccode.length;
     for (node in srccode) {
         cnode=srccode[node]
         if (cnode.nodeName.toUpperCase() == "DIV" || cnode.nodeName.toUpperCase() == "PRE") {
             if (cnode.hasAttribute("title")) {
                 let div = document.createElement("div");
                 div.textContent = cnode.getAttribute("title");
                 div.classList.add("code-title");
                 cnode.parentNode.insertBefore(div,cnode);
                 cnode.style.marginTop = "0px";
             }
         }   
     }
};
</script>
]]

----------------------------
-- based on code from Michael Cysouw
-- https://github.com/cysouw/toc-css/blob/main/toc-css.lua
function addCSS (meta)
  -- read current "header-includes" from metadata, or make a new one
  -- and add css to the end of "header-includes"
  local current = meta['header-includes'] or pandoc.MetaList{meta['header-includes']}
  current[#current+1] = pandoc.MetaBlocks(pandoc.RawBlock("html", css))
  meta['header-includes'] = current
  -- add default toc-title if there is none
  if meta['toc-title'] == nil then
    meta['toc-title'] = "Contents"
  end
  -- return metadata
  return(meta)
end

----------------------------

function addScript (doc)
  -- add javascript to the end of the document
  table.insert(doc.blocks, pandoc.RawBlock("html", script) )
  return(doc)
end

----------------------------

return {
  { Meta = addCSS },
  { Pandoc = addScript }
}
