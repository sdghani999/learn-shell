echo -e "${colour} setup nodejs repos ${nocolour}"
curl -sL https://rpm.nodesource.com/setup_lts.x | bash &>>/tmp/roboshop.log

echo -e "${colour} install nodejs ${nocolour}"
yum install nodejs -y &>>/tmp/roboshop.log

echo -e "${colour} add application user ${nocolour}"
useradd roboshop &>>/tmp/roboshop.log

echo -e "${colour} setup application directory ${nocolour}"
mkdir /app &>>/tmp/roboshop.log

echo -e "${colour} created application directory. ${nocolour}"
curl -L -o /tmp/cart.zip https://roboshop-artifacts.s3.amazonaws.com/cart.zip &>>/tmp/roboshop.log
cd /app &>>/tmp/roboshop.log

echo -e "${colour} extract content ${nocolour}"
unzip /tmp/cart.zip &>>/tmp/roboshop.log

echo -e "${colour} download the dependencies. ${nocolour}"
cd /app &>>/tmp/roboshop.log
npm install &>>/tmp/roboshop.log

echo -e "${colour} Setup SystemD Cart Service ${nocolour}"
cp /etc/systemd/system/cart.service &>>/tmp/roboshop.log

echo -e "${colour} start cart service ${nocolour}"
systemctl daemon-reload &>>/tmp/roboshop.log
systemctl enable cart &>>/tmp/roboshop.log
systemctl restart cart &>>/tmp/roboshop.log