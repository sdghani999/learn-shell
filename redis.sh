source common.sh

echo -e "${colour} install nginx server ${nocolour}"
yum install https://rpms.remirepo.net/enterprise/remi-release-8.rpm -y &>>/tmp/roboshop.log

echo -e "${colour} enable redis ${nocolour}"
yum module enable redis:remi-6.2 -y &>>/tmp/roboshop.log

echo -e "${colour} install redis server ${nocolour}"
yum install redis -y &>>/tmp/roboshop.log

echo -e "${colour} install redis server ${nocolour}"
sed -i 's/127.0.0.1/0.0.0.0' /etc/redis.conf  /etc/redis/redis.conf &>>/tmp/roboshop.log

echo -e "${colour} start redis server ${nocolour}"
systemctl enable redis &>>/tmp/roboshop.log
systemctl restart redis &>>/tmp/roboshop.log
