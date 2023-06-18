source common.sh
component=dispatch


echo -e "${colour} install golang service ${nocolour}"
yum install golang -y

echo -e "${colour} add application user ${nocolour}"
useradd roboshop

echo -e "${colour} creat application directory ${nocolour}"
mkdir ${app-path}

echo -e "${colour} Download the application directory ${nocolour}"
curl -L -o /tmp/${component}.zip https://roboshop-artifacts.s3.amazonaws.com/${component}.zip
cd ${app-path}

echo -e "${colour} extract application content ${nocolour}"
unzip /tmp/${component}.zip

echo -e "${colour} download the dependencies ${nocolour}"
cd ${app-path}
go mod init ${component}
go get
go build

echo -e "${colour} start systemd service ${nocolour}"
cp /etc/systemd/system/${component}.service

echo -e "${colour} start ${component} service ${nocolour}"
systemctl daemon-reload
systemctl enable ${component}
systemctl restart ${component}