source common.sh

echo -e "${colour}configure nodejs repo ${nocolour}"
curl -sL https://rpm.nodesource.com/setup_lts.x | bash &>>/tmp/roboshop.log

echo -e "${colour}install nodejs ${nocolour}"
yum install nodejs -y &>>/tmp/roboshop.log

echo -e "${colour}add application user ${nocolour}"
useradd roboshop &>>/tmp/roboshop.log

echo -e "${colour}configure application Directory ${nocolour}"
rm -rf/ app &>>/tmp/roboshop.log
mkdir /app &>>/tmp/roboshop.log

echo -e "${colour}downlode application content ${nocolour}"
curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip &>>/tmp/roboshop.log
cd /app

echo -e "${colour}extract application content ${nocolour}"
unzip /tmp/catalogue.zip &>>/tmp/roboshop.log
cd /app

echo -e "${colour} install nodejs  dependencies ${nocolour}"
npm install &>>/tmp/roboshop.log

echo -e "${colour}configure catalogue srevice ${nocolour}"
cd catalogue.service/etc/systemd/system/catalogue.service &>>/tmp/roboshop.log


echo -e "${colour}start catalogue service ${nocolour}"
systemctl daemon-reload &>>/tmp/roboshop.log
systemctl enable catalogue &>>/tmp/roboshop.log
systemctl restart catalogue &>>/tmp/roboshop.log

echo -e "${colour}install mongodb clint ${nocolour}"
yum install mongodb-org-shell -y &>>/tmp/roboshop.log

echo -e "${colour} Load Schema ${nocolour}"
mongo --host mongodb-dev.devopsb73.online </app/schema/catalogue.js &>>/tmp/roboshop.log


