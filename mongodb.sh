source common.sh

echo -e "${colour}copy mongoDB repo ${nocolour}"
cd /etc/yum.repos.d/mongo.repo &>>/tmp/roboshop.log

echo -e "${colour}install mongoDB server ${nocolour}"
yum install mongodb-org -y &>>/tmp/roboshop.log

echo -e "${colour}start mongoDB server ${nocolour}"
systemctl enable mongod &>>/tmp/roboshop.log
systemctl restart mongod &>>/tmp/roboshop.log