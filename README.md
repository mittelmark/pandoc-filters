# pandoc-filters

Various filters in Lua and Tcl for the Pandoc document processor

The following filters are provided:

- [filter-pikchr.lua](lua-filters/filter-pikchr.lua) - [Manual :orange_book:](https://htmlpreview.github.io/?https://raw.githubusercontent.com/mittelmark/pandoc-filters/master/doc/filter-pikchr.html)
  adding [pikchr]([https://pikchr.org) diagrams to your documentation directly
- [filter-python.lua](lua-filters/filter-python.lua) -
[Manual :orange_book:](https://htmlpreview.github.io/?https://raw.githubusercontent.com/mittelmark/pandoc-filters/master/doc/filter-python.html) - embed and evaluate Python code in Markdown documents, here an [HTML output file](http://htmlpreview.github.io/?https://github.com/mittelmark/pandoc-filters/blob/master/examples/example-out.html)
- [filter-kroki.lua](lua-filters/filter-kroki.lua) - 
[Manual :orange_book:](https://htmlpreview.github.io/?https://raw.githubusercontent.com/mittelmark/pandoc-filters/master/doc/filter-kroki.html) - embed diagram code and embed image links using the [https://krokio.io](https://kroki.io) webservice, here an [example HTML output file](http://htmlpreview.github.io/?https://github.com/mittelmark/pandoc-filters/blob/master/examples/example-kroki.html)
- [filter-link-to-html.lua](lua-filters/filter-link-to-html.lua) - [Manual :orange_book:](https://htmlpreview.github.io/?https://raw.githubusercontent.com/mittelmark/pandoc-filters/master/doc/filter-link-to-html.html) - convert Markdown or Rst file extensions in links to HTML extensions
- [filter-code-title.lua](lua-filters/filter-code-title.lua) - 
  [Manual :orange_book:](https://htmlpreview.github.io/?https://raw.githubusercontent.com/mittelmark/pandoc-filters/master/doc/filter-code-title.html) - add code block  titles if a title option is given in curly braces for the code chunk

## Other filter links

* [tcl: pantcl](https://github.com/mittelmark/pantcl) - many filters encoded in Tcl as well as standalone application for document conversion
* [lua: acronyms](https://github.com/tarleb/acronyms)  - create abbreviations and lists of abbreviations
* [lua: abstract-section](https://github.com/pandoc-ext/abstract-section) - place the abstract in the document not in the YAML header
* [lua: doi2cite](https://github.com/pandoc/lua-filters/tree/master/doi2cite)
  - add citations using just doi ids
* [lua: filters](https://github.com/pandoc/lua-filters) - collection of lua filters

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
