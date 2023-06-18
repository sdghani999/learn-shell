source common.sh

echo -e "${colour} install python ${nocolour}"
yum install python36 gcc python3-devel -y  &>>${log_file}

echo -e "${colour} add application user${nocolour}"
rm -rf/app  &>>${log_file}
useradd roboshop  &>>${log_file}

echo -e "${colour} creat application directory ${nocolour}"
mkdir /app  &>>${log_file}

echo -e "${colour} downlode application directory  ${nocolour}"
curl -L -o /tmp/payment.zip https://roboshop-artifacts.s3.amazonaws.com/payment.zip  &>>${log_file}
cd /app

echo -e "${colour} extract application content ${nocolour}"
unzip /tmp/payment.zip  &>>${log_file}

echo -e "${colour} download dependencies ${nocolour}"
cd /app
pip3.6 instal -r requirements.txt  &>>${log_file}

echo -e "${colour} start payment service ${nocolour}"
systemctl daemon-reload  &>>${log_file}
systemctl enable payment  &>>${log_file}
systemctl restart payment  &>>${log_file}