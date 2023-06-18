source common.sh
component=${component}

echo -e "${colour} install maven ${nocolour}"
yum install maven -y &>>${log_path}

echo -e "${colour} add application user ${nocolour}"
useradd roboshop &>>${log_path}

echo -e "${colour} creat application directory ${nocolour}"
rm -rf/app
mkdir /app &>>${log_path}

echo -e "${colour} creat application directory ${nocolour}"
curl -L -o /tmp/${component}.zip https://roboshop-artifacts.s3.amazonaws.com/${component}.zip &>>${log_path}


echo -e "${colour} extract the content ${nocolour}"
cd/app
unzip /tmp/${component}.zip &>>${log_path}

echo -e "${colour}  download the dependencies ${nocolour}"
mvn clean package &>>${log_path}
mv target/${component}-1.0.jar ${component}.jar &>>${log_path}

echo -e "${colour} setup systemd service ${nocolour}"
cp /etc/systemd/system/${component}.service &>>${log_path}

echo -e "${colour} install mysql${nocolour}"
yum install mysql -y &>>${log_path}

echo -e "${colour} load schema ${nocolour}"
mysql -h <MYSQL-dev.devopsb73.online> -uroot -pRoboShop@1 < /app/schema/${component}.sql &>>${log_path}

echo -e "${colour} start ${component} service  ${nocolour}"
systemctl daemon-reload &>>${log_path}
systemctl enable ${component} &>>${log_path}
systemctl restart ${component} &>>${log_path}
