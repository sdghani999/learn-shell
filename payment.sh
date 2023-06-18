source common.sh
component=${component}

echo -e "${colour} install python ${nocolour}"
yum install python36 gcc python3-devel -y  &>>${log_file}

echo -e "${colour} add application user${nocolour}"
rm -rf/app  &>>${log_file}
useradd roboshop  &>>${log_file}

echo -e "${colour} creat application directory ${nocolour}"
mkdir /app  &>>${log_file}

echo -e "${colour} downlode application directory  ${nocolour}"
curl -L -o /tmp/${component}.zip https://roboshop-artifacts.s3.amazonaws.com/${component}.zip  &>>${log_file}
cd /app

echo -e "${colour} extract application content ${nocolour}"
unzip /tmp/${component}.zip  &>>${log_file}

echo -e "${colour} download dependencies ${nocolour}"
cd /app
pip3.6 instal -r requirements.txt  &>>${log_file}

echo -e "${colour} start ${component} service ${nocolour}"
systemctl daemon-reload  &>>${log_file}
systemctl enable ${component}  &>>${log_file}
systemctl restart ${component}  &>>${log_file}
