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
<sub>
 sudo systemctl stop firewalld
 sudo systemctl disable firewalld
 sudo yum remove firewalld
 sudo yum install iptables-services
 sudo systemctl enable iptables
 sudo systemctl iptables </sub>
 Now Enable ip forwarding using following commands and steps
 <sub>
 sudo sysctl -w net.ipv4.ip_forward=1
 sudo vi /etc/sysctl.conf
 net.ipv4.ip_forward = 1
 sudo sysctl -p /etc/sysctl.conf </sub>

 

* Windows and Linux Configurations:
To configure servers we 