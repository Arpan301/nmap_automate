#!/bin/bash
#welcome to the nmap automation tool by Arpan
#customise it according to ur need
echo "//////////////////////////// #############  \\\\\\\\\\\\\\\\\\\\\\\"
echo "/////////////////////////                     \\\\\\\\\\\\\\\\\\\\\\"
echo "/////////////////////			       \\\\\\\\\\\\\\\\\\\\\"
echo "/////////////////					  \\\\\\\\\\\\\\\\\\\\"
echo "//////////////  		AUTOMATE NMAP SCRIPT	     \\\\\\\\\\\\\\\\\\"
echo "////////////					       \\\\\\\\\\\\\\\\"
echo "\\\\\\\\\\\\					      /////////////////"
echo "\\\\\\\\\\\\\\					     //////////////////"
echo "\\\\\\\\\\\\\\\\\					   ////////////////////"
echo "\\\\\\\\\\\\\\\\\\\\				///////////////////////"
echo "\\\\\\\\\\\\\\\\\\\\\\\ ######################## ///////////////////////"
#This dezign can cause temporary glitch
echo "Enter the ip which is within the network to be  searched or the web to be searched like 'google.com' form"
read ip 
#takes the ip
echo "Enter 'u' for UDP scan "
echo "Enter 't' for TCP scan"
echo "Enter 'p' for specific port scanning or a range of port"
echo "Enter 's' for specific operations of scripts"
read input
#takes the input for search to be conducted
if [ "$input" == "u" ];
then 
	sudo nmap -sU -Pn $ip
fi
#udp scan
if [ "$input" == "t" ];
then
	
	nmap -sC -sV -Pn $ip
fi
#tcp scan
k="xx"
if [ "$input" == "p" ];
then 
	k="kk"

	if [ "$k" == "kk" ];
	then 
		echo "Enter 'o' for single port scan or any key for others"
		read portt
			if [ "$portt" == "o" ];
			then
				echo " Tell the port "
				echo "example 80 "
				read p1 
					nmap -sC -Pn -p $p1 $ip
	#genaral port scanning		

			else 
				echo "Enter port or press 'alports' for all ports"
				read alpor
				if [ "$alpor" == "alports" ];
				then
					nmap -sC -Pn  -p- $ip
	
				else
					nmap -Pn -sC -p $alpor $ip
				fi
			fi

		fi
fi
if [ "$input" == "s" ];
then
	echo "enter script name "
	echo "if u dont know enter a script from ls /usr/share/nmap/scripts"
	read scripp
	nmap -sC -Pn --script $scripp $ip
fi
#the last is script section of inbuild scripts of nmap
