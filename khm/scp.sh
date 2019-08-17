#/bin/bash
read -p "输入的ip地址:" b
scp /home/student/yum.sh root@$b:/root/yum.sh

