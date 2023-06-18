source common.sh

echo -e "${colour} disable mysql default version ${nocolour}"
yum module disable mysql -y &>>/tmp/roboshop.log

echo -e "${colour} install mysql community server ${nocolour}"
yum install mysql-community-server -y &>>/tmp/roboshop.log

echo -e "${colour} setup mysql repo file ${nocolour}"
cp /etc/yum.repos.d/mysql.repo &>>/tmp/roboshop.log

echo -e "${colour} start mysql service ${nocolour}"
systemctl enable mysqld &>>/tmp/roboshop.log
systemctl restart mysqld &>>/tmp/roboshop.log

echo -e "${colour} setup mysql password ${nocolour}"
mysql_secure_installation --set-root-pass RoboShop@1 &>>/tmp/roboshop.log

