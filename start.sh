#!/bin/bash

# 启动Nginx
service nginx start

# 启动PHP-FPM
service php7.2-fpm start

# 启动MySQL
service mysql start

# 设置MySQL root密码并允许远程连接
mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD' WITH GRANT OPTION;"
mysql -e "FLUSH PRIVILEGES;"

# 保持容器运行
tail -f /dev/null
