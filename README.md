# pandoc-filters

Various filters in Lua and Tcl for the Pandoc document processor

The following filters are provided:

- [filter-python.lua](lua-filters/filter-python.lua) - embed and evaluate Python code in Markdown documents, here an [HTML output file](http://htmlpreview.github.io/?https://github.com/mittelmark/DGTcl/blob/master/pandoc-tcl-filter/filter/filter-abc.html)
- [filter-kroki.lua](lua-filters/filter-kroki.lua) - embed diagram code and embed image links using the [https://krokio.io](https://kroki.io) webservice
- [filter-links-to-html.lua](lua-filters/filter-links-to-html.lua) - convert Markdown file extensions in links to HTML

## Other filter links

* [pandoc-filter](https://github.com/pandoc/lua-filters)
* [pantcl](https://github.com/mittelmark/pandoc-filters) - filters encoded in Tcl as well as standalone application

## Installation

Download the filters from: [https://github.com/mittelmark/pandoc-filters/archive/refs/heads/main.zip](https://github.com/mittelmark/pandoc-filters/archive/refs/heads/main.zip) and place them on your harddisk. If you process your document you specify the filters like this:

```
pandoc input.md -o output.html --lua-filter /path/to/filter-python.py -s 
```


