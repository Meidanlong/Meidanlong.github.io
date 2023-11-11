---
title: GeneFace环境搭建
tags:
  - aigc
---
# 自研路线
## 一、自研流程图
![[E数字人自研流程图.png]]

# 一、安装CUDA

# 二、安装Python库

# 三、准备3DMM模型
## 1、下载 3DMM model
- 在[这个链接](https://faces.dmi.unibas.ch/bfm/index.php?nav=1-2&id=downloads)申请BFM2009 model.
![[申请模型地址.png]]
- 提交申请--等待邮件
- 获取到邮件中的跳转链接已经用户名密码
![[输入邮箱获得的用户名密码.png]]
- 下载模型压缩包`BaselFaceModel.tgz`，将其解压，解压后获得其中 `01_MorphableModel.mat`保存到 `./deep_3drecon/BFM/`文件夹
![[文件解压到本地.png]]
> 

