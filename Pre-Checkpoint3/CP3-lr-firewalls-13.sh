sudo iptables -F
sudo iptables -X
sudo iptables -P INPUT DROP
sudo iptables -P FORWARD DROP
sudo iptables -A INPUT -p tcp -m state --state ESTABLISHED,RELATED -j ACCEPT

sudo iptables -A INPUT -p icmp -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 22 -j ACCEPT 

sudo iptables -I FORWARD -p tcp -d 172.17.13.36 --dport 3389 -j ACCEPT
sudo iptables -I FORWARD -p tcp -d 172.17.13.37 --dport 22 -j ACCEPT
sudo iptables -I FORWARD -p tcp -s 172.17.13.36 --sport 3389 -j ACCEPT
sudo iptables -I FORWARD -p tcp -s 172.17.13.37 --sport 3306 -j ACCEPT
sudo iptables -I FORWARD -p tcp -s 172.17.13.37 --sport 22 -j ACCEPT
sudo iptables -I FORWARD -p icmp -d 172.17.13.36 -j ACCEPT
sudo iptables -I FORWARD -p icmp -s 172.17.13.36 -j ACCEPT