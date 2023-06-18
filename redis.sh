source common.sh
component=${component}

echo -e "${colour} install nginx server ${nocolour}"
yum install https://rpms.remirepo.net/enterprise/remi-release-8.rpm -y &>>${log_path}

echo -e "${colour} enable ${component} ${nocolour}"
yum module enable ${component}:remi-6.2 -y &>>${log_path}
echo -e "${colour} install ${component} server ${nocolour}"
yum install ${component} -y &>>${log_path}
echo -e "${colour} install ${component} server ${nocolour}"
sed -i 's/127.0.0.1/0.0.0.0' /etc/${component}.conf  /etc/${component}/${component}.conf &>>${log_path}

echo -e "${colour} start ${component} server ${nocolour}"
systemctl enable ${component} &>>${log_path}
systemctl restart ${component} &>>${log_path}

