source common.sh
component=rabbitmq

echo -e "${colour} configure erlang repos ${nocolour}"
curl -s https://packagecloud.io/install/repositories${component}/erlang/script.rpm.sh | bash &>>${log_file}

echo -e "${colour} configure rabbitmq repos ${nocolour}"
curl -s https://packagecloud.io/install/repositories${component}${component}-server/script.rpm.sh | bash &>>${log_file}

echo -e "${colour} install rabbitmq server ${nocolour}"
yum install rabbitmq-server -y &>>${log_file}

echo -e "${colour} start rabbitmq service ${nocolour}"
systemctl enable rabbitmq-server &>>${log_file}
systemctl start rabbitmq-server &>>${log_file}

echo -e "${colour} add rabbitmq application user ${nocolour}"
rabbitmqctl add_user roboshop roboshop123 &>>${log_file}
rabbitmqctl set_permissions -p / roboshop ".*" ".*" ".*" &>>${log_file}
