FROM ubuntu:18.04

# 设置默认目录
WORKDIR /var/www/html

# 安装必要的软件包和依赖项
RUN apt-get update && \
    apt-get -y upgrade && \
    DEBIAN_FRONTEND=noninteractive apt-get -y install nginx mysql-server-5.7 php-fpm php-mysql && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# 配置Nginx
COPY ./nginx.conf /etc/nginx/nginx.conf

# 配置PHP-FPM
RUN sed -i 's/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/g' /etc/php/7.2/fpm/php.ini

# 配置mysql允许远程连接
RUN sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mysql/mysql.conf.d/mysqld.cnf

# 配置目录权限
RUN chown -R www-data:www-data /var/www/html

# 设置MySQL root密码
ENV MYSQL_ROOT_PASSWORD=KHLsdksdf3459k@hk

# 复制启动脚本
COPY ./start.sh /
RUN chmod +x /start.sh

# 暴露端口
EXPOSE 80
EXPOSE 3306

# 启动Nginx、PHP-FPM和MySQL
CMD ["/start.sh"]
