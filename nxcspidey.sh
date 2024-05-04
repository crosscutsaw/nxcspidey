#!/bin/bash

bblue='\033[1;34m'
bbred='\033[1;31m'
bgreen='\033[1;32m'
bwhite='\033[1;37m'
reset='\033[0m'

echo ''
echo -e "${bblue}nxcspidey v1.1${reset}"
echo ''

echo -e "${bbred}removing old files if they are exist or not.${reset}"
rm -rf /tmp/nxcspidey
echo ''

if ! command -v nxc &> /dev/null || ! command -v netexec &> /dev/null; then
    echo -e "${bbred}netexec is not present.${reset}"
    echo ''
    echo -e "${bwhite}type y to download netexec.${reset}"
    echo -e "${bwhite}type n to exit script, launch your virtualenv (if you have) then rerun script again.${reset}"
    read response1
        if [ "$response1" = "y" ]; then
            echo ''
            echo -e "${bgreen}downloading netexec to \"/usr/bin/\" as \"nxc\".${reset}"
            wget https://github.com/Pennyw0rth/NetExec/releases/latest/download/nxc -O /usr/bin/nxc
            chmod +x /usr/bin/nxc
        elif [ "$response1" = "n" ]; then
            exit
        else
            echo 'deadass???'
            exit
        fi
else
    echo -e "${bgreen}netexec is present.${reset}"
fi

echo ''
echo -e "${bgreen}starting nxcspidey. $(date)${reset}"
echo ''
mkdir /tmp/nxcspidey

domain_user="uuuuuuuuuuuuuuu"
domain_pass='ppppppppppppppp'
domain_name="ddddddddddddddd" #not fqdn, enter short name.
share_extensions=".vhd .vbk .vmdk .cfg .config .conf credentials db. config. group groups pwd pass password dbpass dbpwd db_password db_pass sifre şifre cpassword"
extensions_pattern=$(echo $share_extensions | grep -o '\S*\.[[:alnum:]]\S*' | tr '\n' '|' | sed 's/|$//')

nxc smb p445.txt -u $domain_user -p $domain_pass -d $domain_name --shares > /tmp/nxcspidey/nxcspidey_temp.txt

for i in $(egrep -e "(WRITE|READ)" /tmp/nxcspidey/nxcspidey_temp.txt | awk '{print $2}' | uniq); do
	for j in $(egrep -e "(WRITE|READ)" /tmp/nxcspidey/nxcspidey_temp.txt | awk '{print $5}'); do
		nxc smb $i -u $domain_user -p $domain_pass -d $domain_name --spider $j --pattern $share_extensions --content | grep size | sed 's/\(pattern\)/\o033[31m\1\o033[39m/' >> /tmp/nxcspidey/nxcspidey.txt
	done	
done
rm -rf /tmp/nxcspidey/nxcspidey_temp.txt
echo -e "${bgreen}process is completed. $(date)${reset}"
echo ''
cat /tmp/nxcspidey/nxcspidey.txt | sed -r "s/($extensions_pattern)/\o033[30;42m\1\o033[0m/g" | sort -u

# nxcspidey 1.1
# 
# contact options
# mail: https://blog.zurrak.com/contact.html
# twitter: https://twitter.com/tasiyanci
# linkedin: https://linkedin.com/in/aslanemreaslan