
echo -e "\e[33mconfigure nodejs repo \e[0m"
curl -sL https://rpm.nodesource.com/setup_lts.x | bash &>>/tmp/roboshop.log

echo -e "\e[33minstall nodejs \e[0m"
yum install nodejs -y &>>/tmp/roboshop.log

echo -e "\e[33madd application user \e[0m"
useradd roboshop &>>/tmp/roboshop.log

echo -e "\e[33mconfigure application Directory \e[0m"
rm -rf/ app &>>/tmp/roboshop.log
mkdir /app

echo -e "\e[33mdownlode application content \e[0m"
curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip &>>/tmp/roboshop.log
cd /app

echo -e "\e[33mextraction content \e[0m"
unzip /tmp/catalogue.zip &>>/tmp/roboshop.log
cd /app

echo -e "\e[33m download the dependencies \e[0m"
npm install &>>/tmp/roboshop.log

echo -e "\e[33mconfigure catalogue srevice \e[0m"
cd /catalogue.service/etc/systemd/system/catalogue.service &>>/tmp/roboshop.log


echo -e "\e[33mstart catalogue service \e[0m"
systemctl daemon-reload &>>/tmp/roboshop.log
systemctl enable catalogue
systemctl start catalogue

echo -e "\e[33minstall mongodb clint \e[0m"
yum install mongodb-org-shell -y &>>/tmp/roboshop.log

echo -e "\e[33m Load Schema \e[0m"
mongo --host mongodb-dev.devopsb73.online </app/schema/catalogue.js &>>/tmp/roboshop.log
