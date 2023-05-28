echo -e"\e[33mcopy mongoDB repo \e[0m"
cd /etc/yum.repos.d/mongo.repo &>>/tmp/roboshop.log

echo -e"\e[33minstall mongoDB server \e[0m"
yum install mongodb-org -y &>>/tmp/roboshop.log

echo -e"\e[33mstart mongoDB server \e[0m"
systemctl enable mongod &>>/tmp/roboshop.log
systemctl restart mongod &>>/tmp/roboshop.log