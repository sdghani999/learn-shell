source common.sh

echo -e "${colour} configure erlang repos ${nocolour}"
curl -s https://packagecloud.io/install/repositories/rabbitmq/erlang/script.rpm.sh | bash &>>/tmp/roboshop.log

echo -e "${colour} configure rabbitmq repos ${nocolour}"
curl -s https://packagecloud.io/install/repositories/rabbitmq/rabbitmq-server/script.rpm.sh | bash &>>/tmp/roboshop.log

echo -e "${colour} install rabbitmq server ${nocolour}"
yum install rabbitmq-server -y &>>/tmp/roboshop.log

echo -e "${colour} start rabbitmq service ${nocolour}"
systemctl enable rabbitmq-server &>>/tmp/roboshop.log
systemctl start rabbitmq-server &>>/tmp/roboshop.log

echo -e "${colour} add rabbitmq application user ${nocolour}"
rabbitmqctl add_user roboshop roboshop123 &>>/tmp/roboshop.log
rabbitmqctl set_permissions -p / roboshop ".*" ".*" ".*" &>>/tmp/roboshop.log
