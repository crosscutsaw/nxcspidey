## about nxcspidey v1.4
nxcspidey is a bash script that uses netexec's share spider feature, but in bulk.
## how to use
-> put your port 445 ips to p445.txt file (same directory where nxcspidey sits on)

-> add or remove desired file extensions or patterns in script (share_extensions line)

-> execute nxcspidey.sh

-> profit

## extensions explanation
-> .vhd >>> fixed suffix. it can be emre.vhd, important.vhd, deadasscompanydc01.vhd.. etc

-> config. >>> fixed prefix. it can be config.cfg, config.pkcs, config.deadass.. etc

-> credentials, dbpass, cpassword >>> it can be both filename or matching pattern in file. intended use is matching pattern.

## decide your scan
-> extension scan just scans extensions in filenames. i.e if you leave ".conf" in your share_extensions line then you'd get; "apache.conf", "web.config" and "style.configuration" in your results.

![](https://raw.githubusercontent.com/crosscutsaw/nxcspidey/main/n1.PNG)

-> content scan scans extensions in filenames and content inside them. if you have no access to gui then it's a best option to enumerate. because of scanning content, it'd take a lot of time. even you'd get netbios timeout errors.

![](https://raw.githubusercontent.com/crosscutsaw/nxcspidey/main/n2.PNG)