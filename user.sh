source common.sh
component=${component}


 echo -e "${colour} Setup NodeJS repos ${nocolour}"
 curl -sL https://rpm.nodesource.com/setup_lts.x | bash &>>${log_path}

echo -e "${colour} install nodejs ${nocolour}"
 yum install nodejs -y &>>${log_path}

echo -e "${colour} add application ${component} ${nocolour}"
 ${component}add roboshop &>>${log_path}

echo -e "${colour} creat application directory ${nocolour}"
rm -rf/app &>>${log_path}
 mkdir /app &>>${log_path}

echo -e "${colour} downlode application directory ${nocolour}"
 curl -L -o /tmp/${component}.zip https://roboshop-artifacts.s3.amazonaws.com/${component}.zip &>>${log_path}
 cd /app &>>${log_path}

 cho -e "${colour} extract application content ${nocolour}"
 unzip /tmp/${component}.zip &>>${log_path} &>>${log_path}

echo -e "${colour}downlode dependencies ${nocolour}"
 cd /app &>>${log_path}
 npm install &>>${log_path}

 echo -e "${colour} setup systemD ${component} srevices ${nocolour}"
cp /etc/systemd/system/${component}.service &>>${log_path}

echo -e "${colour} copy mongodb repos ${nocolour}"
cp /etc/yum.repos.d/mongo.repo &>>${log_path}

echo -e "${colour} start ${component} service ${nocolour}"
 systemctl daemon-reload &>>${log_path}
 systemctl enable ${component} &>>${log_path}
 systemctl restart ${component} &>>${log_path}


echo -e "${colour} install mongodb clint ${nocolour}"
 yum install mongodb-org-shell -y &>>${log_path}

 echo -e "${colour} lode schema ${nocolour}"
 mongo --host mongodb-dev.devopsb73.online </app/schema/${component}.js &>>${log_path}


