echo "\e[32minstall nginx server \e[0m"
yum install nginx -y

echo "\e[32mremove the content \e[0m"
rm -rf /usr/share/nginx/html/*

echo "\e[32mdownlode the content \e[0m"
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip

echo "\e[32copy the content \e[0m"
cd /usr/share/nginx/html

echo "\e[32mextract the content \e[0m"
unzip /tmp/frontend.zip

echo "\e[32mstart nginx server \e[0m"
systemctl enable nginx
systemctl restart nginx

