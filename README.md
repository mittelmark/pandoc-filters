# pandoc-filters

Various filters in Lua and Tcl for the Pandoc document processor

The following filters are provided:

- [filter-python.lua](lua-filters/filter-python.lua) - embed and evaluate Python code in Markdown documents, here an [HTML output file](http://htmlpreview.github.io/?https://github.com/mittelmark/pandoc-filters/blob/master/examples/example-out.html)
- [filter-kroki.lua](lua-filters/filter-kroki.lua) - embed diagram code and embed image links using the [https://krokio.io](https://kroki.io) webservice, here an [example HTML output file](http://htmlpreview.github.io/?https://github.com/mittelmark/pandoc-filters/blob/master/examples/example-kroki.html)
- [filter-links-to-html.lua](lua-filters/filter-links-to-html.lua) - convert Markdown file extensions in links to HTML
- [filter-code-title.lua](lua-filters/filter-code-title.lua) - add code block
  titles if a title option is given in curly braces for the code chunk - 
(documentation)[https://htmlpreview.github.io/?https://raw.githubusercontent.com/mittelmark/pandoc-filters/master/doc/filter-code-title.html]

## Other filter links

* [lua: acronyms](https://github.com/tarleb/acronyms)  - create abbreviations and lists of abbreviations
* [lua: abstract-section](https://github.com/pandoc-ext/abstract-section) - place the abstract in the document not in the YAML header
* [lua: filters](https://github.com/pandoc/lua-filters) - collection of lua filters
* [pantcl](https://github.com/mittelmark/pantcl) - filters encoded in Tcl as well as standalone application

## Installation

Download the filters from: [https://github.com/mittelmark/pandoc-filters/archive/refs/heads/main.zip](https://github.com/mittelmark/pandoc-filters/archive/refs/heads/main.zip) and place them on your harddisk. If you process your document you specify the filters like this:

```
pandoc input.md -o output.html --lua-filter /path/to/filter-python.py -s 
```

Alternatively you can place the files into your pandoc user directory which you
can find out by writing `pandoc -v` in your terminal. If you place your Lua files
into this folder you can use the lua filters without using the file path like
this:

```
pandoc input.md -o output.html --lua-filter filter-code-title.lua -s
```
