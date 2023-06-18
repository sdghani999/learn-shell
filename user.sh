 echo -e "${colour} Setup NodeJS repos ${nocolour}"
 curl -sL https://rpm.nodesource.com/setup_lts.x | bash &>>/tmp/roboshop.log

echo -e "${colour} install nodejs ${nocolour}"
 yum install nodejs -y &>>/tmp/roboshop.log

echo -e "${colour} add application user ${nocolour}"
 useradd roboshop &>>/tmp/roboshop.log

echo -e "${colour} creat application directory ${nocolour}"
rm -rf/app &>>/tmp/roboshop.log
 mkdir /app &>>/tmp/roboshop.log

echo -e "${colour} downlode application directory ${nocolour}"
 curl -L -o /tmp/user.zip https://roboshop-artifacts.s3.amazonaws.com/user.zip &>>/tmp/roboshop.log
 cd /app &>>/tmp/roboshop.log

 cho -e "${colour} extract application content ${nocolour}"
 unzip /tmp/user.zip &>>/tmp/roboshop.log &>>/tmp/roboshop.log

echo -e "${colour}downlode dependencies ${nocolour}"
 cd /app &>>/tmp/roboshop.log
 npm install &>>/tmp/roboshop.log

 echo -e "${colour} setup systemD user srevices ${nocolour}"
cp /etc/systemd/system/user.service &>>/tmp/roboshop.log

echo -e "${colour} copy mongodb repos ${nocolour}"
cp /etc/yum.repos.d/mongo.repo &>>/tmp/roboshop.log

echo -e "${colour} start user service ${nocolour}"
 systemctl daemon-reload &>>/tmp/roboshop.log
 systemctl enable user &>>/tmp/roboshop.log
 systemctl restart user &>>/tmp/roboshop.log


echo -e "${colour} install mongodb clint ${nocolour}"
 yum install mongodb-org-shell -y &>>/tmp/roboshop.log

 echo -e "${colour} lode schema ${nocolour}"
 mongo --host mongodb-dev.devopsb73.online </app/schema/user.js &>>/tmp/roboshop.log

