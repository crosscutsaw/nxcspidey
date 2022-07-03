#!/bin/bash

# cmespidey
# 
# contact options
# mail: https://vvmlist.github.io/contact.html
# twitter: https://twitter.com/tasiyanci
# linkedin: https://linkedin.com/in/aslanemreaslan

domain_user="domainuser"
domain_pass='domainpass'
share_extensions="vhd vbk vmdk iso cfg config"

crackmapexec smb p445.txt -u $domain_user -p $domain_pass --shares > cmespidey_temp.txt

for i in $(egrep -e "(WRITE|READ)" cmespidey_temp.txt | awk '{print $2}' | uniq); do
	for j in $(egrep -e "(WRITE|READ)" cmespidey_temp.txt | awk '{print $5}' | cut -c 10- | uniq); do
		crackmapexec smb $i -u $domain_user -p $domain_pass --spider $j --pattern $share_extensions | grep size >> cmespidey.txt
	done	
done
rm -rf cmespidey_temp.txt
echo "####################"; echo "process is completed"; echo "####################"; echo ""
cat cmespidey.txt | sort | uniq