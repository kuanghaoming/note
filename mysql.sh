#!/bin/bash
mysql=mysql-5.7.17.tar
cd /root/mysql
mv $mysql /root
cd /root
tar -xf $mysql
yum -y install mysql-community*
systemctl start mysqld
systemctl enable mysqld
a=`awk -F ': ' '/password/{print $2}' /var/log/mysqld.log`
echo 'validate_password_policy=0' >> /etc/my.cnf
echo 'validate_password_length=6' >> /etc/my.cnf
systemctl restart mysqld
mysqladmin -uroot -p"$a" password "123456"
sed -i '$d' /etc/my.cnf
sed -i '$d' /etc/my.cnf
