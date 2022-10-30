## Checkpoint2-Part1
 
 * COURSE INFORMATION: CSN400 NAA
 * STUDENT’S NAME: Prabhdeep Kaur Cheema
 * STUDENT'S NUMBER: 13
 * GITHUB USER_ID: myseneca-125823203
 * TEACHER’S NAME: Atoosa Nasiri
 * ASSIGNMENT REF: Checkpoint2-Part1-Report

## Table Of Contents:
1. [Result for VM list command](##Result%20for%20VM%20list%20command)
2. [Result for Custom image list command](##Result%20for%20Custom%20image%20list%20command)
3. [Result for iptables list command in lr13](##Result%20for%20iptables%20list%20command%20in%20lr13) 
4. [Result for iptables list command in ls13](##Result%20for%20iptables%20list%20command%20in%20ls13) 

 ## Result for Commands
 * Result for VM list command:
 ```
 odl_user [ ~ ]$ az lab vm list  --lab-name CSN400-DTL --resource-group Student-RG-739244
 Command group 'lab' is in preview and under development. Reference and support levels: https://aka.ms/CLI_refstatus
 []
 ```
 * Result for Custom image list command:
 ```
 odl_user [ ~ ]$ az lab custom-image list  --lab-name CSN400-DTL --resource-group Student-RG-739244 --query "[ [].name , [].vm.sourceVmId ]" 
Command group 'lab' is in preview and under development. Reference and support levels: https://aka.ms/CLI_refstatus
[
  [
    "wc13ci",
    "lr13ci",
    "ws13ci",
    "ls13ci",
    "wc13-cp2",
    "lr13-cp2",
    "ws13-cp2",
    "ls13-cp2"
  ],
  [
    "/subscriptions/bd627181-5ddb-4bb6-b03f-5297c3be4e1e/resourcegroups/student-rg-739244/providers/microsoft.devtestlab/labs/csn400-dtl/virtualmachines/wc13",
    "/subscriptions/bd627181-5ddb-4bb6-b03f-5297c3be4e1e/resourcegroups/student-rg-739244/providers/microsoft.devtestlab/labs/csn400-dtl/virtualmachines/lr13",
    "/subscriptions/bd627181-5ddb-4bb6-b03f-5297c3be4e1e/resourcegroups/student-rg-739244/providers/microsoft.devtestlab/labs/csn400-dtl/virtualmachines/ws13",
    "/subscriptions/bd627181-5ddb-4bb6-b03f-5297c3be4e1e/resourcegroups/student-rg-739244/providers/microsoft.devtestlab/labs/csn400-dtl/virtualmachines/ls13",
    "/subscriptions/bd627181-5ddb-4bb6-b03f-5297c3be4e1e/resourcegroups/student-rg-739244/providers/microsoft.devtestlab/labs/csn400-dtl/virtualmachines/wc13",
    "/subscriptions/bd627181-5ddb-4bb6-b03f-5297c3be4e1e/resourcegroups/student-rg-739244/providers/microsoft.devtestlab/labs/csn400-dtl/virtualmachines/lr13",
    "/subscriptions/bd627181-5ddb-4bb6-b03f-5297c3be4e1e/resourcegroups/student-rg-739244/providers/microsoft.devtestlab/labs/csn400-dtl/virtualmachines/ws13",
    "/subscriptions/bd627181-5ddb-4bb6-b03f-5297c3be4e1e/resourcegroups/student-rg-739244/providers/microsoft.devtestlab/labs/csn400-dtl/virtualmachines/ls13"
  ]
]
 ```

 * Result of iptables list command in lr13
 ```
 [pkcheema5@LR-13 ~]$ sudo iptables -nvL
Chain INPUT (policy ACCEPT 1191 packets, 280K bytes)
 pkts bytes target     prot opt in     out     source               destination

Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination

Chain OUTPUT (policy ACCEPT 1585 packets, 387K bytes)
 pkts bytes target     prot opt in     out     source               destination

 ```

 * Result of iptables list command in ls13
 ```
 [pkcheema5@LS-13 ~]$ sudo iptables -nvL
Chain INPUT (policy ACCEPT 11 packets, 20K bytes)
 pkts bytes target     prot opt in     out     source               destination

Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination

Chain OUTPUT (policy ACCEPT 1585 packets, 387K bytes)
 pkts bytes target     prot opt in     out     source               destination

 ```