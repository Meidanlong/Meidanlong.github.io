echo '回到项目根目录..'
cd ..

# 同步代码
echo '1、同步主分支代码'
git pull origin master
git add .
git commit -m "update"
git push -f "git@github.com:Meidanlong/meidanlong.github.io.git" master:master


# 构建代码
echo '2、构建前端页面'
rm -rf public
npx quartz build

# push public目录
echo '3、同步页面代码/发布服务'
cd public
# 发布到域名
echo 'www.meidanlong.com' > CNAME
git init
#git gc --prune=now
git add .
git commit -m "deploy"
sleep 5
git push -f "git@github.com:Meidanlong/meidanlong.github.io.git" master:gh-pages

echo '4、发布完成'
