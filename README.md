## about nxcspidey v1.1
nxcspidey is a bash script that uses netexec's share spider feature, but in bulk.
## how to use
-> put your port 445 ips to p445.txt file

-> add or remove desired file extensions or patterns in script (share_extensions line)

-> execute nxcspidey.sh

-> profit

## extensions explanation
-> .vhd >>> fixed suffix. it can be emre.vhd, important.vhd, deadasscompanydc01.vhd.. etc

-> config. >>> fixed prefix. it can be config.cfg, config.pkcs, config.deadass.. etc

-> credentials, dbpass, cpassword >>> it can be both filename or matching pattern in file. intended use is matching pattern.

## warning for pattern search
-> if you leave a pattern like "password" in share_extensions then your scan would take a much time. avoid pattern matching if you can.

## example output
![](https://raw.githubusercontent.com/crosscutsaw/nxcspidey/main/1111.PNG)
![](https://raw.githubusercontent.com/crosscutsaw/nxcspidey/main/2222.PNG)
*still not tested in customer active directory environment*
