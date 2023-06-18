source common.sh
component=frontend

echo -e "${colour}install nginx server ${nocolour}"
yum install nginx -y &>>/tmp/roboshop.log
stat_check $?

echo -e "${colour}remove the content ${nocolour}"
rm -rf /usr/share/nginx/html/* &>>/tmp/roboshop.log
stat_check $?

echo -e "${colour}downlode the ${component} content ${nocolour}"
curl -o /tmp/${component}.zip https://roboshop-artifacts.s3.amazonaws.com/${component}.zip &>>/tmp/roboshop.log
stat_check $?

echo -e "${colour}copy the ${component} content ${nocolour}"
cd /usr/share/nginx/html &>>/tmp/roboshop.log
stat_check $?

echo -e "${colour}extract the frotend content ${nocolour}"
unzip /tmp/${component}.zip &>>/tmp/roboshop.log
stat_check $?

echo -e "${colour}start nginx server ${nocolour}"
systemctl enable nginx &>>/tmp/roboshop.log
systemctl restart nginx &>>/tmp/roboshop.log
stat_check $?






