echo -e "\e[33m install golang service \e[0m"
yum install golang -y

echo -e "\e[33m add application user \e[0m"
useradd roboshop

echo -e "\e[33m creat application directory \e[0m"
mkdir /app

echo -e "\e[33m Download the application directory \e[0m"
curl -L -o /tmp/dispatch.zip https://roboshop-artifacts.s3.amazonaws.com/dispatch.zip
cd /app

echo -e "\e[33m extract application content \e[0m"
unzip /tmp/dispatch.zip

echo -e "\e[33m download the dependencies \e[0m"
cd /app
go mod init dispatch
go get
go build

echo -e "\e[33m start systemd service \e[0m"
cp /etc/systemd/system/dispatch.service

echo -e "\e[33m start dispatch service \e[0m"
systemctl daemon-reload
systemctl enable dispatch 
systemctl restart dispatch