# installation commands for the vulnerable machine MESWCOE

#update repos
sudo apt update

#installing apache
sudo apt install -y apache2

#installing gcc
sudo apt install -y gcc

# installing and configuring ftp
sudo apt install -y vsftpd
sudo ufw allow 20
sudo ufw allow 21
sudo mkdir /var/ftp
sudo chown nobody:nogroup /var/ftp
sudo sed -i 's/anonymous_enable=NO/anonymous_enable=Yes/' /etc/vsftpd.conf
sudo chmod 777 vsftpd.conf
sudo echo "anon_root=/var/ftp/" >> /etc/vsftpd.conf
sudo systemctl restart vsftpd


#installing and configuring ssh
sudo apt install openssh-server -y
sudo ufw allow ssh

#moving the txt to ftp 
sudo cp /root/data/admissioncerti.txt /var/ftp/admissioncerti.txt

# add user student
sudo useradd -m student
sudo echo student:'qwerty' | sudo chpasswd
sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config && sudo systemctl restart sshd


#privesc
sudo cp /root/data/study.c /usr/local/bin/study.c
sudo cp /root/data/exam.txt /exam.txt
sudo gcc /usr/local/bin/study.c -o /usr/local/bin/study
sudo chmod u+s /usr/local/bin/study
sudo chmod 400 /exam.txt

#cleanning up
sudo echo "[+] Disabling IPv6"
sudo echo "net.ipv6.conf.all.disable_ipv6 = 1" >> /etc/sysctl.conf
sudo echo "net.ipv6.conf.default.disable_ipv6 = 1" >> /etc/sysctl.conf
sudo sed -i 's/GRUB_CMDLINE_LINUX_DEFAULT=""/GRUB_CMDLINE_LINUX_DEFAULT="ipv6.disable=1"/' /etc/default/grub
sudo sed -i 's/GRUB_CMDLINE_LINUX=""/GRUB_CMDLINE_LINUX="ipv6.disable=1"/' /etc/default/grub
sudo update-grub
sudo hostnamectl set-hostname student
cat << EOF > /etc/hosts
127.0.0.1 localhost
127.0.0.1 student
EOF

sudo ln -sf /dev/null /root/.bash_history
sudo ln -sf /dev/null /home/student/.bash_history

sudo sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

sudo echo "root:meswcoewarrior" | sudo chpasswd
sudo sh -c 'cat <<EOF > /root/marksheet.txt
great job!!!
you scored 9.8 cgpa


This ctf challenge is now over you have reached the root flag
root:meswcoewarrior

@creator
oumzarkar
EOF'
sudo chmod 0600 /root/marksheet.txt
