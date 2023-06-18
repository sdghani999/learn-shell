source common.sh
component=mysql

echo -e "${colour} disable ${component} default version ${nocolour}"
yum module disable ${component} -y &>>${log_file}

echo -e "${colour} install ${component} community server ${nocolour}"
yum install ${component}-community-server -y &>>${log_file}

echo -e "${colour} setup ${component} repo file ${nocolour}"
cp /etc/yum.repos.d/${component}.repo &>>${log_file}

echo -e "${colour} start ${component} service ${nocolour}"
systemctl enable ${component}d &>>${log_file}
systemctl restart ${component}d &>>${log_file}

echo -e "${colour} setup ${component} password ${nocolour}"
${component}_secure_installation --set-root-pass RoboShop@1 &>>${log_file}

