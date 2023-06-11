echo -e "\e[33m install python \e[0m"
yum install python36 gcc python3-devel -y  &>>/tmp/roboshop.log

echo -e "\e[33m add application user\e[0m"
rm -rf/app  &>>/tmp/roboshop.log
useradd roboshop  &>>/tmp/roboshop.log

echo -e "\e[33m creat application directory \e[0m"
mkdir /app  &>>/tmp/roboshop.log

echo -e "\e[33m downlode application directory  \e[0m"
curl -L -o /tmp/payment.zip https://roboshop-artifacts.s3.amazonaws.com/payment.zip  &>>/tmp/roboshop.log
cd /app

echo -e "\e[33m extract application content \e[0m"
unzip /tmp/payment.zip  &>>/tmp/roboshop.log

echo -e "\e[33m download dependencies \e[0m"
cd /app
pip3.6 instal -r requirements.txt  &>>/tmp/roboshop.log

echo -e "\e[33m start payment service \e[0m"
systemctl daemon-reload  &>>/tmp/roboshop.log
systemctl enable payment  &>>/tmp/roboshop.log
systemctl restart payment  &>>/tmp/roboshop.log