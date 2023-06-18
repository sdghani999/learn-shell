source common.sh
component=catalogue

echo -e "${colour}configure nodejs repo ${nocolour}"
curl -sL https://rpm.nodesource.com/setup_lts.x | bash &>>/tmp/roboshop.log

echo -e "${colour}install nodejs ${nocolour}"
yum install nodejs -y &>>/tmp/roboshop.log

echo -e "${colour}add application user ${nocolour}"
useradd roboshop &>>/tmp/roboshop.log

echo -e "${colour}configure application Directory ${nocolour}"
rm -rf/ app &>>/tmp/roboshop.log
mkdir ${app-path} &>>/tmp/roboshop.log

echo -e "${colour}downlode application content ${nocolour}"
curl -o /tmp/${component}.zip https://roboshop-artifacts.s3.amazonaws.com/${component}.zip &>>/tmp/roboshop.log
cd ${app-path}

echo -e "${colour}extract application content ${nocolour}"
unzip /tmp/${component}.zip &>>/tmp/roboshop.log
cd ${app-path}

echo -e "${colour} install nodejs  dependencies ${nocolour}"
npm install &>>/tmp/roboshop.log

echo -e "${colour}configure ${component} srevice ${nocolour}"
cd ${component}.service/etc/systemd/system/${component}.service &>>/tmp/roboshop.log


echo -e "${colour}start ${component} service ${nocolour}"
systemctl daemon-reload &>>/tmp/roboshop.log
systemctl enable ${component} &>>/tmp/roboshop.log
systemctl restart ${component} &>>/tmp/roboshop.log

echo -e "${colour}install mongodb clint ${nocolour}"
yum install mongodb-org-shell -y &>>/tmp/roboshop.log

echo -e "${colour} Load Schema ${nocolour}"
mongo --host mongodb-dev.devopsb73.online <${app-path}/schema/${component}.js &>>/tmp/roboshop.log


