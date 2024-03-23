---
title: Pikchr Filter Example
author: Detlef Groth
date: 2023-09-29
include-before: |
    <center> 
    [example-kroki](example-kroki.html) - 
    [example-pikchr](example-pikchr.html) -
    [example-python](example-out.html)  
    </center>
---

## Introduction

This is a Pikchr example. Here a flowchart diagram:

```{.pikchr width=400px}
arrow right 200% "Markdown" "Source"
box rad 10px "Markdown" "Formatter" "(markdown.c)" fit
arrow right 200% "HTML+SVG" "Output"
arrow <-> down 70% from last box.s
box same "Pikchr" "Formatter" "(pikchr.c)" fit
```

Now with echo=true:

```{.pikchr width=400px echo=true}
arrow right 200% "Markdown" "Source"
box rad 10px "Markdown" "Formatter" "(markdown.c)" fit
arrow right 200% "HTML+SVG" "Output"
arrow <-> down 70% from last box.s
box same "Pikchr" "Formatter" "(pikchr.c)" fit
```

Now just a check that the pikchr filter can be combined with the kroki filter.


```{.kroki}
class A { }
class B { }
A -> B
```

## EOF



