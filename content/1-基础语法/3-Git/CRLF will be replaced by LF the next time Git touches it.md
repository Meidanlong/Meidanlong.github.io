# 解决

1、Windows环境：
```bash Windows
# 提交时转换为LF，检出时转换为CRLF 
git config --global core。autocrlf true

# 或者，提交时转换为LF，检出时转换为CRLF 
git config --global core。autocrlf true
```
2、Mac/Linux环境：
```bash Mac/Linux
# 提交时转换为LF，检出时不转换
git config --global core。autocrlf input
```