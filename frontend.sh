source common.sh

echo -e "${colour}install nginx server ${nocolour}"
yum install nginx -y &>>/tmp/roboshop.log
stat_check $?

echo -e "${colour}remove the content ${nocolour}"
rm -rf /usr/share/nginx/html/* &>>/tmp/roboshop.log
stat_check $?

echo -e "${colour}downlode the frontend content ${nocolour}"
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip &>>/tmp/roboshop.log
stat_check $?

echo -e "${colour}copy the frontend content ${nocolour}"
cd /usr/share/nginx/html &>>/tmp/roboshop.log
stat_check $?

echo -e "${colour}extract the frotend content ${nocolour}"
unzip /tmp/frontend.zip &>>/tmp/roboshop.log
stat_check $?

echo -e "${colour}start nginx server ${nocolour}"
systemctl enable nginx &>>/tmp/roboshop.log
systemctl restart nginx &>>/tmp/roboshop.log
stat_check $?






