echo -e "\e[33minstall nginx server \e[0m"
yum install nginx -y &>>/tmp/roboshop.log

echo -e "\e[33mremove the content \e[0m"
rm -rf /usr/share/nginx/html/* &>>/tmp/roboshop.log

echo -e "\e[33mdownlode the frontend content \e[0m"
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip &>>/tmp/roboshop.log

echo -e "\e[33mcopy the frontend content \e[0m"
cd /usr/share/nginx/html &>>/tmp/roboshop.log

echo -e "\e[33mextract the frotend content \e[0m"
unzip /tmp/frontend.zip &>>/tmp/roboshop.log

echo -e "\e[33mstart nginx server \e[0m"
systemctl enable nginx &>>/tmp/roboshop.log
systemctl restart nginx &>>/tmp/roboshop.log





