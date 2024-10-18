#!/bin/bash
get_ip_address() {
IP_ADDR=$(hostname -I | awk '{print $1}')
echo $IP_ADDR
}
echo "1) Download and run WebGoat"
echo "2) Run WebGoat"
read -p "(1 or 2):" choice
case $choice in
1)
sudo apt-get update && sudo apt-get upgrade -y
sudo apt install openjdk-17-jdk -y
wget https://github.com/WebGoat/WebGoat/releases/download/v2023.8/webgoat-2023.8.jar
;;
2)
echo "Skipping download..."
;;
*)
echo "Invalid choice! Exiting..."
exit 1
;;
esac
java -jar webgoat-2023.8.jar --server.address=0.0.0.0 &
IP_ADDR=$(get_ip_address)
echo "WebGoat URL http://$IP_ADDR:8080/WebGoat"
