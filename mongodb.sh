source common.sh
component=${component}

echo -e "${colour}copy ${component} repo ${nocolour}"
cd /etc/yum.repos.d/mongo.repo &>>${log_file}

echo -e "${colour}install ${component} server ${nocolour}"
yum install ${component}-org -y &>>${log_file}

echo -e "${colour}start ${component} server ${nocolour}"
systemctl enable mongod &>>${log_file}
systemctl restart mongod &>>${log_file}
