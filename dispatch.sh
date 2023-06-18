source common.sh
component=dispatch


echo -e "${colour} install golang service ${nocolour}"
yum install golang -y  ${log_file}

echo -e "${colour} add application user ${nocolour}"
useradd roboshop  ${log_file}

echo -e "${colour} creat application directory ${nocolour}"
mkdir ${app-path}  ${log_file}

echo -e "${colour} Download the application directory ${nocolour}"
curl -L -o /tmp/${component}.zip https://roboshop-artifacts.s3.amazonaws.com/${component}.zip  ${log_file}
cd ${app-path}  ${log_file}

echo -e "${colour} extract application content ${nocolour}"
unzip /tmp/${component}.zip  ${log_file}

echo -e "${colour} download the dependencies ${nocolour}"
cd ${app-path}  ${log_file}
go mod init ${component}  ${log_file}
go get  ${log_file}
go build  ${log_file}

echo -e "${colour} start systemd service ${nocolour}"
cp /etc/systemd/system/${component}.service  ${log_file}

echo -e "${colour} start ${component} service ${nocolour}"
systemctl daemon-reload  ${log_file}
systemctl enable ${component}  ${log_file}
systemctl restart ${component}  ${log_file}