## about cmespidey v1.1
cmespidey is a bash script that uses crackmapexec's share spider feature, but in bulk.
## how to use
-> put your port 445 ip's to p445.txt file

-> add or remove desired file extensions or patterns in script (share_extensions line)

-> adjust threads if you want (default: -t 80)

-> execute smbspidey.sh

-> profit

## extensions explanation
-> .vhd >>> fixed suffix. it can be emre.vhd, important.vhd, deadasscompanydc01.vhd.. etc

-> config. >>> fixed prefix. it can be config.cfg, config.pkcs, config.deadass.. etc

-> credentials, dbpass, cpassword >>> it can be both filename or matching pattern in file. intended use is matching pattern.

## example output
![](https://raw.githubusercontent.com/crosscutsaw/cmespidey/main/cmespidey.PNG)
*still not tested in customer active directory environment*
