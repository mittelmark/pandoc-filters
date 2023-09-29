---
title: Kroki Filter Example
author: Detlef Groth
date: 2023-02-01
include-before: |
    <center> 
    [example-kroki](example-kroki.html) - 
    [example-pikchr](example-pikchr.html) -
    [example-python](example-out.html)  
    </center>
---

## Introduction

This is a kroki example. Here a class diagram:

```{.kroki}
@startuml
class A {}
class B {}
@enduml
```

And here a mindmap:

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

## EOF



