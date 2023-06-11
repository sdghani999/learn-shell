echo -e "\e[33m install maven \e[0m"
yum install maven -y &>>/tmp/roboshop.log

echo -e "\e[33m add application user \e[0m"
useradd roboshop &>>/tmp/roboshop.log

echo -e "\e[33m creat application directory \e[0m"
rm -rf/app
mkdir /app &>>/tmp/roboshop.log

echo -e "\e[33m creat application directory \e[0m"
curl -L -o /tmp/shipping.zip https://roboshop-artifacts.s3.amazonaws.com/shipping.zip &>>/tmp/roboshop.log


echo -e "\e[33m extract the content \e[0m"
cd/app
unzip /tmp/shipping.zip &>>/tmp/roboshop.log

echo -e "\e[33m  download the dependencies \e[0m"
mvn clean package &>>/tmp/roboshop.log
mv target/shipping-1.0.jar shipping.jar &>>/tmp/roboshop.log

echo -e "\e[33m setup systemd service \e[0m"
cp /etc/systemd/system/shipping.service &>>/tmp/roboshop.log

echo -e "\e[33m install mysql\e[0m"
yum install mysql -y &>>/tmp/roboshop.log

echo -e "\e[33m load schema \e[0m"
mysql -h <MYSQL-dev.devopsb73.online> -uroot -pRoboShop@1 < /app/schema/shipping.sql &>>/tmp/roboshop.log

echo -e "\e[33m start shipping service  \e[0m"
systemctl daemon-reload &>>/tmp/roboshop.log
systemctl enable shipping &>>/tmp/roboshop.log
systemctl restart shipping &>>/tmp/roboshop.log