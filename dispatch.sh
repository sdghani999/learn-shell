echo -e "${colour} install golang service ${nocolour}"
yum install golang -y

echo -e "${colour} add application user ${nocolour}"
useradd roboshop

echo -e "${colour} creat application directory ${nocolour}"
mkdir /app

echo -e "${colour} Download the application directory ${nocolour}"
curl -L -o /tmp/dispatch.zip https://roboshop-artifacts.s3.amazonaws.com/dispatch.zip
cd /app

echo -e "${colour} extract application content ${nocolour}"
unzip /tmp/dispatch.zip

echo -e "${colour} download the dependencies ${nocolour}"
cd /app
go mod init dispatch
go get
go build

echo -e "${colour} start systemd service ${nocolour}"
cp /etc/systemd/system/dispatch.service

echo -e "${colour} start dispatch service ${nocolour}"
systemctl daemon-reload
systemctl enable dispatch 
systemctl restart dispatch