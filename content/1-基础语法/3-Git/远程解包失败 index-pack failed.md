---
title: 远程解包失败 index-pack failed
tags:
  - git
  - qa
---
# 一、现象
![[git问题  index-pack failed.png]]
# 二、原因
Git在解压缩（解包）对象时出现了异常，导致推送失败。
# 三、解决
```git title="清除本地缓存"
git gc --prune=now
```
再次执行后续命令即可。