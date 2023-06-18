source common.sh

echo -e "${colour} install python ${nocolour}"
yum install python36 gcc python3-devel -y  &>>/tmp/roboshop.log

echo -e "${colour} add application user${nocolour}"
rm -rf/app  &>>/tmp/roboshop.log
useradd roboshop  &>>/tmp/roboshop.log

echo -e "${colour} creat application directory ${nocolour}"
mkdir /app  &>>/tmp/roboshop.log

echo -e "${colour} downlode application directory  ${nocolour}"
curl -L -o /tmp/payment.zip https://roboshop-artifacts.s3.amazonaws.com/payment.zip  &>>/tmp/roboshop.log
cd /app

echo -e "${colour} extract application content ${nocolour}"
unzip /tmp/payment.zip  &>>/tmp/roboshop.log

echo -e "${colour} download dependencies ${nocolour}"
cd /app
pip3.6 instal -r requirements.txt  &>>/tmp/roboshop.log

echo -e "${colour} start payment service ${nocolour}"
systemctl daemon-reload  &>>/tmp/roboshop.log
systemctl enable payment  &>>/tmp/roboshop.log
systemctl restart payment  &>>/tmp/roboshop.log