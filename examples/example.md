---
title: "Example File for Lua Filters"
author: Detlef Groth
date: 2023-02-01
abstract: >
    Some abstract ...
    on several lines...
py:
    cache: true
    eval: true
---


## Introduction

The link to the output file should be here: [example-out.html](http://htmlpreview.github.io/?https://github.com/mittelmark/pandoc-filters/blob/master/examples/example-out.html).

Here is a link to a Markdown/HTML file using the kroki filter: [filter-kroki.md](filter-kroki.md)

Here today's date calculated in Python with inline code:  `py import datetime;print(datetime.date.today())`. 

Please note that inline code has no access to variables declared outside.

This is a test of *italics* and __bold__ text.

Chunk 1:

```{.py}
z = 0
print(z)
```

Next chunk!

```{.py}
x = 1
print(x)
```

And another results are cached so previous variables are visible using `dir`:

```{.py}
y = 2
print(y)
print(dir())
print(z)
```

The next chunk has no cache, so x, y and z are not visible anymore.

```{.py cache=false}
k=1
print(dir())
```

## EOF
