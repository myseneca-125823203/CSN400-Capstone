sudo iptables -F
sudo iptables -X
sudo iptables -P INPUT DROP
sudo iptables -A INPUT -p tcp -m state --state ESTABLISHED,RELATED -j ACCEPT

sudo iptables -A INPUT -p icmp -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 22 -j ACCEPT