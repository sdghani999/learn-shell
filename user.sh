 echo -e "\e[33m Setup NodeJS repos \e[0m"
 curl -sL https://rpm.nodesource.com/setup_lts.x | bash &>>/tmp/roboshop.log

echo -e "\e[33m install nodejs \e[0m"
 yum install nodejs -y &>>/tmp/roboshop.log

echo -e "\e[33m add application user \e[0m"
 useradd roboshop &>>/tmp/roboshop.log

echo -e "\e[33m creat application directory \e[0m"
rm -rf/app &>>/tmp/roboshop.log
 mkdir /app &>>/tmp/roboshop.log

echo -e "\e[33m downlode application directory \e[0m"
 curl -L -o /tmp/user.zip https://roboshop-artifacts.s3.amazonaws.com/user.zip &>>/tmp/roboshop.log
 cd /app &>>/tmp/roboshop.log

 cho -e "\e[33m extract application content \e[0m"
 unzip /tmp/user.zip &>>/tmp/roboshop.log &>>/tmp/roboshop.log

echo -e "\e[33mdownlode dependencies \e[0m"
 cd /app &>>/tmp/roboshop.log
 npm install &>>/tmp/roboshop.log

 echo -e "\e[33m setup systemD user srevices \e[0m"
cp /etc/systemd/system/user.service &>>/tmp/roboshop.log

echo -e "\e[33m copy mongodb repos \e[0m"
cp /etc/yum.repos.d/mongo.repo &>>/tmp/roboshop.log

echo -e "\e[33m start user service \e[0m"
 systemctl daemon-reload &>>/tmp/roboshop.log
 systemctl enable user &>>/tmp/roboshop.log
 systemctl restart user &>>/tmp/roboshop.log


echo -e "\e[33m install mongodb clint \e[0m"
 yum install mongodb-org-shell -y &>>/tmp/roboshop.log

 echo -e "\e[33m lode schema \e[0m"
 mongo --host mongodb-dev.devopsb73.online </app/schema/user.js &>>/tmp/roboshop.log
