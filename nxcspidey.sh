#!/bin/bash

if ! command -v ack &> /dev/null; then
    echo "installing ack."    
    apt update
    apt install -y ack
else
    echo "ack is already installed."
fi

if ! command -v nxc &> /dev/null; then
    echo "downloading netexec"
    wget https://github.com/Pennyw0rth/NetExec/releases/latest/download/nxc -O /usr/bin/nxc
    chmod +x /usr/bin/nxc    
else
    echo "netexec is already installed."
fi

domain_user="domainuser"
domain_pass='domainpass'
share_extensions=".vhd .vbk .vmdk .cfg .config .conf credentials db. config. group groups pwd pass password dbpass dbpwd db_password db_pass sifre şifre cpassword"
extensions_pattern=$(echo $share_extensions | grep -o '\S*\.[[:alnum:]]\S*' | tr '\n' '|' | sed 's/|$//')

nxc smb p445.txt -u $domain_user -p $domain_pass --shares > nxcspidey_temp.txt

for i in $(egrep -e "(WRITE|READ)" nxcspidey_temp.txt | awk '{print $2}' | uniq); do
	for j in $(egrep -e "(WRITE|READ)" nxcspidey_temp.txt | awk '{print $5}'); do
		nxc smb $i -u $domain_user -p $domain_pass --spider $j --pattern $share_extensions --content | grep size | sed 's/\(pattern\)/\o033[31m\1\o033[39m/' >> nxcspidey.txt
	done	
done
rm -rf nxcspidey_temp.txt
echo "####################"; echo "process is completed"; echo "####################"; echo ""
cat nxcspidey.txt | ack --passthru $extensions_pattern

# nxcspidey 1.0
# 
# contact options
# mail: https://blog.zurrak.com/contact.html
# twitter: https://twitter.com/tasiyanci
# linkedin: https://linkedin.com/in/aslanemreaslan
