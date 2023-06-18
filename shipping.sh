source common.sh

echo -e "${colour} install maven ${nocolour}"
yum install maven -y &>>/tmp/roboshop.log

echo -e "${colour} add application user ${nocolour}"
useradd roboshop &>>/tmp/roboshop.log

echo -e "${colour} creat application directory ${nocolour}"
rm -rf/app
mkdir /app &>>/tmp/roboshop.log

echo -e "${colour} creat application directory ${nocolour}"
curl -L -o /tmp/shipping.zip https://roboshop-artifacts.s3.amazonaws.com/shipping.zip &>>/tmp/roboshop.log


echo -e "${colour} extract the content ${nocolour}"
cd/app
unzip /tmp/shipping.zip &>>/tmp/roboshop.log

echo -e "${colour}  download the dependencies ${nocolour}"
mvn clean package &>>/tmp/roboshop.log
mv target/shipping-1.0.jar shipping.jar &>>/tmp/roboshop.log

echo -e "${colour} setup systemd service ${nocolour}"
cp /etc/systemd/system/shipping.service &>>/tmp/roboshop.log

echo -e "${colour} install mysql${nocolour}"
yum install mysql -y &>>/tmp/roboshop.log

echo -e "${colour} load schema ${nocolour}"
mysql -h <MYSQL-dev.devopsb73.online> -uroot -pRoboShop@1 < /app/schema/shipping.sql &>>/tmp/roboshop.log

echo -e "${colour} start shipping service  ${nocolour}"
systemctl daemon-reload &>>/tmp/roboshop.log
systemctl enable shipping &>>/tmp/roboshop.log
systemctl restart shipping &>>/tmp/roboshop.log