---
title: 切换Git远程仓库
tags:
  - git
---
# 一、切换远程仓库地址

## 1、直接修改远程路径

```
git remote set-url origin URL
```

## 2、先删除再添加

```
# 删除现有库
git remote rm origin
# 添加新库
git remote add origin url
```

# 二、查看远程仓库地址

```
git remote -v
```