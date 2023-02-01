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

Here today's date calculated in Python:  `py import datetime;print(datetime.date.today())`

This is a test *this*.

```{.py}
z = 0
print(z)
```

Next chunk!

```{.py}
x = 1
print(x)
```


```{.py}
y = 2
print(y)
print(dir())
print(z)
```

```{.py cache=false}
k=1
print(dir())
```

## EOF
