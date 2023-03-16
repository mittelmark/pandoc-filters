---
title: This is a sample document for Markdown with title code chunks
author: N N
date: 2023-03-16
header-includes: 
- | 
    ```{=html}
    <style>
    pre.sourceCode { 
        background: #ffcccc; 
        padding: 8px;
        font-size: 90%;
    }
    .code-title {
      background-color: #ddaaaa;
    } 
    </style>
    ```

---

## Introduction

Some text

* list
* list
    * sublist
    * sublist

```{.tcl eval=true title="Tcl example 1:"}
set x 1
puts $x
```

Some  more text!

```{class="sourceCode" title="Pure Code block"}
print("Hello World!);
```

## EOF

