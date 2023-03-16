---
title: Documentation Filter filter-kroki.lua 
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
kroki:
    cache: false
    ext: "svg"
---

## Name

`filter-kroki.lua` - create diagrams using the [https://kroki.io/](https://kroki.io) 
webservice.

## Usage

```
$ pandoc infile.md -o outfile.html -s --lua-filter /path/to/filter-kroki.lua
```

Chunk declaration: `{.kroki}`

Chunk options: `{.kroki option=value}`

- _cache_ - should images be chaced locally and re-fetched if code changes, default: false
- _caption_ the figure caption, default: ""
- _dia_ - diagram type usch as 'graphviz', 'plantuml', 'dbml', 'ditaa' and many
  others,see [here](https://kroki.io/#support) for formats, default: 'plantuml'  
- _echo_ - should the code chunk been show, default: _true_
- _ext_ - the file extension, either 'svg', 'png' or 'pdf', not all diagram types
  support 'png' and 'pdf', default: 'svg'
- *fig_path* - path to the image folder if _cache_ is _true_, default: 'images'
- *fig_prefix* - filename prefix if _cache_ is _true_, default: 'kroki'

You can change a few defaults: _cache_, _dia_, _echo_, _ext_, *fig_path*, *fig_prefix* in the YAML document preamble like this:

```
---
...
kroki:
    fig_path: img
    cache: true
---
```

Thereafter all code chunks will have these as the default settings.
## Introduction

This filter allows you embed diagram figures supported by the Kroki webservice
without installing additional tools, only a existing Python interpreter is
required. The figures can be cached locally if the code chunk option is set to
true, images are the only fetched again if the source code changes.

## Examples

Let's start with a PlantUML class diagram:

```
    ```{.kroki}
    @startuml
    class A {}
    class B {}
    A -> B
    @enduml
    ``` 
```

And here the output:

```{.kroki}
@startuml
class A {}
class B {}
A -> B
@enduml
```

And here a PlantUML mindmap:

```{.kroki}
@startmindmap
+ hello 1
++ sub hello 1.1
++ sub hello 1.2
+ hello 2
++ sub hello 2.1
-- negative hello
@endmindmap
```

And now we hide the code (echo=false), just showing the colors:


```{.kroki echo=false}
@startuml
colors
@enduml
```
Let's give now a Ditaa diagram, chunk settings `{.kroki dia="ditaa"}`:

```{.kroki dia="ditaa"}
+----------------------------------------+
| File | Help   cEEE                     |
+-------------+--------------------------+
|  ttk.Button | ttk.Combobox             |
+-------------+--------------------------+
|             |                          |
| tk.Listbox  | tk.Text                  |
|             |                          |
|            <+>                         |
|             |                          |
|             |                          |
|             |                          |
+-------------+--------+-----------------+
| ttk.Label            | ttk.Progressbar |
+----------------------+-----------------+
```

## Installation

Copy the file `filter-kroki.lua` to your `pandoc` user data directory. On Unix
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
$ pandoc input.md -o output.html -s --lua-filter filter-kroki.lua
```

You can as well rename the file to something like `code-title.lua`.

## TODO's

- svg2png conversion using cairosvg

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

