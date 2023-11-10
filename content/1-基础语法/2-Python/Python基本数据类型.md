---
title: 基本数据类型
tags:
  - python
---
![[python基本数据类型图.png]]
# 一、数字

# 二、组

## 1、序列

### 1.1、字符串

### 1.2、列表

## 4、符号
在Python中，`*`符号有两个主要的用途：
1. 作为数学运算符，表示乘法。例如，`2 * 3`的结果是6。
2. 在函数调用和定义中，表示可变数量的位置参数。你可以使用`*`来将一个列表或元组的元素作为位置参数传递给一个函数，或者在函数定义中接收任意数量的位置参数。
**举例：**
```python title="函数调用"
def greet(greeting, name):
   print(f"{greeting}, {name}!")

params = ["Hello", "Alice"]
greet(*params)  # 输出：Hello, Alice!
```

```python title="函数定义"
def print_numbers(*args):
   for number in args:
       print(number)

print_numbers(1, 2, 3, 4, 5)  
# 输出：
# 1
# 2
# 3
# 4
# 5
```
