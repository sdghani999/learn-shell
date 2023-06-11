echo -e "\e[33m setup nodejs repos \e[0m"
curl -sL https://rpm.nodesource.com/setup_lts.x | bash &>>/tmp/roboshop.log

echo -e "\e[33m install nodejs \e[0m"
yum install nodejs -y &>>/tmp/roboshop.log

echo -e "\e[33m add application user \e[0m"
useradd roboshop &>>/tmp/roboshop.log

echo -e "\e[33m setup application directory \e[0m"
mkdir /app &>>/tmp/roboshop.log

echo -e "\e[33m created application directory. \e[0m"
curl -L -o /tmp/cart.zip https://roboshop-artifacts.s3.amazonaws.com/cart.zip &>>/tmp/roboshop.log
cd /app &>>/tmp/roboshop.log

echo -e "\e[33m extract content \e[0m"
unzip /tmp/cart.zip &>>/tmp/roboshop.log

echo -e "\e[33m download the dependencies. \e[0m"
cd /app &>>/tmp/roboshop.log
npm install &>>/tmp/roboshop.log

echo -e "\e[33m Setup SystemD Cart Service \e[0m"
cp /etc/systemd/system/cart.service &>>/tmp/roboshop.log

echo -e "\e[33m start cart service \e[0m"
systemctl daemon-reload &>>/tmp/roboshop.log
systemctl enable cart &>>/tmp/roboshop.log
systemctl restart cart &>>/tmp/roboshop.log