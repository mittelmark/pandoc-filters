---
title: Documentation Filter filter-link-to-html.lua 
author: Detlef Groth, University of Potsdam, Germany
date: 2023-03-16
header-includes: 
- | 
    ```{=html}
    <style>
    body { max-width: 1000px; font-size: 100%; }
    pre { background: rgb(250,229,211); padding: 8px; }
    pre.sourceCode, pre.py { 
        background: #eeeeee; 
        padding: 8px;
        font-size: 95%;
    }
    .code-title {
      background: #dddddd;
      padding: 8px;
    } 
    </style>
    ```
---

## Name

`filter-link-to-html.lua` - convert Markdown or Rst links to HTML document links.

## Usage

```
$ pandoc infile.md -o outfile.html -s --lua-filter /path/to/filter-link-to-html
```

## Description

This filter converts all links in a Document pointing to other Markdown or Rst
files into HTML links. This is useful if you like to maintain a set of Markdown
files which can be browsed on a website supporting and rendering such Markdown
files as interactive documents such as Github or Gitlab powered websites.
You can then convert these files to HTML and adapt the links accordingly to point
to the HTML pages and not to the Markdown or Rst pages anymore.


## Examples

```
This link to this Markdown page [filter-link-to-html](filter-link-to-html.md) will
be converted to an HTML link if the conversion to an HTML using the filter is done.
```

Here the output:

This link to this Markdown page [filter-link-to-html](filter-link-to-html.md) will be converted to 
an HTML link if the conversion to an HTML using the filter is done.

## Installation

Copy the file `filter-link-to-html.lua` to your `pandoc` user data directory. On Unix
systems that is usually in `~/.local/share/pandoc`. You can find out the location
of this directory by using the `-v` argument for the `pandoc` console application
like this:
 

```{style="background: white;"}
$ pandoc -v
pandoc 2.14.2
Compiled with pandoc-types 1.22, texmath 0.12.3.1, skylighting 0.11,
citeproc 0.5, ipynb 0.1.0.1
User data directory: /home/username/.local/share/pandoc
Copyright (C) 2006-2021 John MacFarlane. Web:  https://pandoc.org
This is free software; see the source for copying conditions. There is no
warranty, not even for merchantability or fitness for a particular purpose.
```

After you copied the file to the user data directory you can use the filter like
this:

```{style="background: white;"}
$ pandoc input.md -o output.html -s --lua-filter filter-link-to-html.lua
```

You can as well rename the file to something like `link-to-html.lua`.

## TODO's

- Other formats, Rst, etc.

## Author

Detlef Groth, University of Potsdam, Germany

## License

```{style="background: white;"}
Copyright 2023, Detlef Groth

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the “Software”), to deal in the
Software without restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the
Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN
AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
```

