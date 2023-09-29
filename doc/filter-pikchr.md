---
title: Documentation Filter filter-pikchr.lua 
author: Detlef Groth, University of Potsdam, Germany
date: 2023-09-29
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

`filter-pikchr.lua` - create diagrams using the [https://pikchr.org/](https://pikchr.org) 
diagram language.

## Usage

```
$ pandoc infile.md -o outfile.html -s --lua-filter /path/to/filter-pikchr.lua
```

Chunk declaration: `{.pikchr}`

Chunk options: `{.pikchr option=value}`

- _width_ - the figure width, it is advisable to adapt the width or height only, default: full width
- _height_ the figure height, it is advisable to adapt the width or height only,default: full height
- _echo_ - should the code chunk been show, default: _false_

## Introduction

This filter allows you embed diagram  figures  supported by the Pikchr diagram
language.  It  requires  that  either  the pikchr or the fossil  command  line
applications  are installed and can be executed from the PATH. These tools can
be either installed from your package manager or  installed from here:

- https://www2.fossil-scm.org/home/uv/download.html
- https://pikchr.org/home/doc/trunk/doc/download.md

## Examples

Let's just show the standard example:


```
    ```{.pikchr}
    arrow right 200% "Markdown" "Source"
    box rad 10px "Markdown" "Formatter" "(markdown.c)" fit
    arrow right 200% "HTML+SVG" "Output"
    arrow <-> down 70% from last box.s
    box same "Pikchr" "Formatter" "(pikchr.c)" fit
    ```
```

And here the output:

```{.pikchr}
arrow right 200% "Markdown" "Source"
box rad 10px "Markdown" "Formatter" "(markdown.c)" fit
arrow right 200% "HTML+SVG" "Output"
arrow <-> down 70% from last box.s
box same "Pikchr" "Formatter" "(pikchr.c)" fit
```

And here the same code and the output using an adapted width and echo enabled (`{.pikchr width=400 echo=true}`):

```{.pikchr width=400 echo=true}
arrow right 200% "Markdown" "Source"
box rad 10px "Markdown" "Formatter" "(markdown.c)" fit
arrow right 200% "HTML+SVG" "Output"
arrow <-> down 70% from last box.s
box same "Pikchr" "Formatter" "(pikchr.c)" fit
```

## Installation

Copy the file `filter-pikchr.lua` to your `pandoc` user data directory. On Unix
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
$ pandoc input.md -o output.html -s --lua-filter filter-pikchr.lua
```

You can as well rename the file to something like `pikchr.lua`.

## TODO's

- svg2png conversion using cairosvg
- save cached images instead if embedding

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

