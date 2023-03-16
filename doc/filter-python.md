---
title: Documentation Filter filter-python.lua 
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
py:
    cache: true
    eval: true
---

## Name

`filter-python.lua` - evaluate inline Python code in Markdown documents.

## Usage

```
$ pandoc infile.md -o outfile.html -s --lua-filter /path/to/filter-python.lua
```

Chunk declaration: `{.py}`

Chunk options: `{.py option=value}`

- _cache_ - should variables and functions be saved for subsequent code chunks,
  default: _false_
- _echo_ - should the code chunk been show, default: _true_
- _eval_ - should the code chunk be evaluated, default: _false_
- _results_ - 'show' or 'hide' the results of code chunk evaluations, default:
  'show'


## Introduction

This filter allows you evaluate Python code within your Markdown documents and add
the output to your final document. It is a very simple filter which should be used
to add a few lines of Python code without to much effort and additional tools. For
more serious approaches you might be better using tools like [Jupyter
notebooks](https://github.com/jupyter/notebook) or
[pweave](https://github.com/mpastell/Pweave).

## Code Blocks

You can place python code inside code blocks typed with `.py`, to enable code evaluation you have
to set `eval=true` in the chunk options.

Here an example:

```
     ```{.py eval=true"}
     import sys
     print(sys.version)
     ```
```

The spacing at the beginning should be removed, they are just given to avoid
interpretation of the example code by Pandoc.

Here the output:

```{.py eval=true title="Example 1:"}
import sys
print(sys.version)
```

You can activate code evaluation for all chunks as default by using the YAML
header and you can style the code block directly in the document preamble
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
py:
    cache: true
    eval: true
---
```

If cache is set to true as in the example for this document, the variables and
defined methods will be visible as well in later code chunks. Let's create an
example.

```{.py}
def test ():
    print("This is method test!")
x = 1 
print(x)
test()
```

In our next code chunk we inspect the existing objects in the current scope using
the `dir` command:

```{.py}
print(dir())
```

As you can the function and the variable from a previous code chunk are still
available, lets use them again:

```{.py}
test()
x=x+1
print(x)
```

The code chunks can be as well evaluated invisibly, as you often only like to show
for instance figures or tables but not the code which was generating them, in this
case to hide code and output you might set `show="hide"` and `echo=false` like
here:

```
    ```{.py echo=false results="hide"}
    x = 4
    print(x)
   ```
```

Here the "output". You can't see anything:

```{.py echo=false results="hide"}
x = 4
print(x)
```

As you can see nothing I will now output the value of x, so that you believe me:

```{.py}
print(x)
```


## Figure Example

If you draw figures you have to save them as files within your code chunk as there
is no default inclusion implemented. Here an example using Matplotlib

```{.py}
import matplotlib.pyplot as plt
import numpy as np

x = np.linspace(0, 2 * np.pi, 200)
y = np.sin(x)

fig, ax = plt.subplots()
ax.plot(x, y)
plt.savefig('figure.png')
```

You can then display the figure using standard Markdown syntax like here:

```
![](figure.png)
```

![](figure.png)

## Inline Python Code

You can as well place short inline code chunks inside your standard text.
Currently this however has no access to variables and functions defined in the
code chunks. Here an example to add a date inside your document.

```
This document was created on `py import datetime;print(datetime.date.today())`!
```

And here the output:


This document was created on `py import datetime;print(datetime.date.today())`!

## Installation

Copy the file `filter-python.lua` to your `pandoc` user data directory. On Unix
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
$ pandoc input.md -o output.html -s --lua-filter filter-python.lua
```

You can as well rename the file to something like `code-title.lua`.

## TODO's

- chunk option `results="asis"` to create Markdown code

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

