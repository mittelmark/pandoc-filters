---
title: Documentation Filter filter-code-title.lua 
author: Detlef Groth, University of Potsdam, Germany
date: 2023-03-16
header-includes: 
- | 
    ```{=html}
    <style>
    body { max-width: 1000px; font-size: 100%; }
    pre { background: rgb(250,229,211); padding: 8px; }
    pre.sourceCode { 
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

`filter-code-title.lua` - add code block titles to your HTML documents.

## Introduction

This filter allows you to give your code blocks a title usually placed just above
the code block, but the placement can be configured by the user using own style
sheet settings in the YAML header. The filter does only work with HTML output and
requires Javascript enabled browser.

Here an example:


```
     ```{.tcl eval=true title="Example 1:"}
     set x 1
     puts $x
     ```
```

The spacing at the beginning should be removed, they are just given to avoid
interpretation of the example code by Pandoc.

Here the output:

```{.tcl eval=true title="Example 1:"}
set x 1
puts $x
```

To avoid the syntax coloring you can just omit the programming language indicator
at the beginning of the chunk options like here:

```
     ```{class="sourceCode" title="Example 2:"}
     print("Hello World!);
     ```
```

And here the ouput:

```{class="sourceCode" title="Example 2:"}
set x 1
puts $x
```

You can style the title block and the code block directly in the document preamble
in the YAML header, here an example which is based on the current document you are
viewing:

```
---
title: title
author: author
date: 2023-XX-XX
header-includes: 
- | 
    ```{=html}
    <style>
    body { max-width: 1000px; font-size: 100%; }
    pre { background: rgb(250,229,211); padding: 8px; }
    pre.sourceCode { 
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
```


## Installation

Copy the file `filter-code-title.lua` to your `pandoc` user data directory. On Unix
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
$ pandoc input.md -o output.html -s --lua-filter filter-code-title.lua
```

You can as well rename the file to something like `code-title.lua`.

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

