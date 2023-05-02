#构建命令
cd lnmp
docker build -t mylnmp .

#运行
docker run -p 80:80 -p 3306:3306 -e MYSQL_ROOT_PASSWORD=rootpassword mylnmp 
