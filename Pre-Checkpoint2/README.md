# Pre-Checkpoint2 Submission

 * COURSE INFORMATION: CSN400 NAA
 * STUDENT’S NAME: Prabhdeep Kaur Cheema
 * STUDENT'S NUMBER: 13
 * GITHUB USER_ID: myseneca-125823203
 * TEACHER’S NAME: Atoosa Nasiri
 

## DevTest Lab Configuration
 To create a DTL for CSN400 login to azure portal and search DevTest Lab under search and click create to create a new lab resource. Create a new DTL with name CSN400-DTL and location being the same as the resource group location. After the DTL lab is created click  Lab Configurations and settings to change configurations.
 First, set Auto shutdown to automatically shutdown every resource after 3:00 am (Chose this tie to ensure it does not get shutdown while working on it.)
 Secondly, click Lab settings and change Reader access to Contributor access to ensure we can edit all settings of the virtual machines.
 Lastly, link all three virtual networks to ensure the connectivity to all vnets. Enable all vnets first subnet to be used in the virtual machine creation.


## Virtual Machines Creation
 To create virtual machines login to azure and go to azure DTL created earlier and click create.
 First create a Windows Client Machine with name wc-13 using Windows 10 Pro 21H1 as the base image for VM and username as pkcheema5 and choose virtual network to be student-739244-vnet then click create.
 Then create a Linux Router VM using Red Hat Enterprise 8.1 as the VM base and name lr-13 username being pkcheema5 and type password. Then choose the vnet to be Router-13 then ensure subnet1 is being used.
 Now create a Windows server VM using Windows Server 2019 as the VM base and name the VM as ws-13. Now select vnet to be Server-13 and ensure subnet1 is being used.
 Lastly, create the Linux server using Red Hat Enterprise 8.1 as the base again and name it ls-13. Ensure subnet Server-13 us being used and leave everything default.

## Virtual Machines Configurations
* Windows Client- wc13: 
To configure windows client install the following softwares using Microsoft Edge browser by opening a bastion session with widnwos client from DTL.

Mozilla Firefox browser
MySQL Client Shell
Wireshark
FileZilla FTP Client

* Linux Router Configurations:
 To configure router we need to connect using windows client as bastion first then open command prompt to opn ssh session with router with command
 ssh pkcheema5@192.168.13.36
 Enter password when prompted then configure the followng tasks to ensure connectivity between the virtual machines.
 Firstly remove firwalld and install iptables
 ```
 sudo systemctl stop firewalld
 sudo systemctl disable firewalld
 sudo yum remove firewalld
 sudo yum install iptables-services
 sudo systemctl enable iptables
 sudo systemctl iptables 
 ```
 Now Enable ip forwarding using following commands and steps
 ```
 sudo sysctl -w net.ipv4.ip_forward=1
 sudo vi /etc/sysctl.conf
 net.ipv4.ip_forward = 1
 sudo sysctl -p /etc/sysctl.conf
 ```
 For passwordless login to router we will create ssh keys 
 Run the following command to create ssh rsa keys in router
 ```
 ssh-keygen -t rsa
 ```
 Accept everything default and press enter every time it prompts for anything. 
 Now Transfer the public key from router to windows client by command
 ```
 scp pkcheema5@192.168.13.36:/home/pkcheema5/.ssh/id_rsa.pub .\.ssh\known_hosts
 ```
 At last we would need to add iptables rules to allow access to servers.
 Create iptables.sh file in home idrectory of pkcheema5 user in router and add following lines in that file.
 ```
 sudo iptables -I FORWARD -p tcp -s 172.16.13.36 --sport 3389 -j ACCEPT
 sudo iptables -I FORWARD -p tcp -d 172.16.13.36 --dport 3389 -j ACCEPT
 sudo iptables -I FORWARD -p tcp -s 172.16.13.37 --sport 22 -j ACCEPT
 sudo iptables -I FORWARD -p tcp -d 172.16.13.37 --dport 22 -j ACCEPT
 ```
 Then provide execure permissions to iptables.sh file and execute it. After ensuring the connectivities run following commands to save iptables.
 ```
 sudo service iptables save
 ```

* Windows and Linux Configurations:
To configure servers we need to access the servers using windows client. First open rdp connection to widnows sever ip addess then install Firefox and wireshark. In Linux server we need to open ssh session to Linux sever ip from command prompt. Run following script in linux serveer for iptables.
 ```
 sudo systemctl stop firewalld
 sudo systemctl disable firewalld
 sudo yum remove firewalld
 sudo yum install iptables-services
 sudo systemctl enable iptables
 sudo systemctl iptables
 ```