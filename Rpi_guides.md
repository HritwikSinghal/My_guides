

# Raspberry Pi


## Brother Printer Driver Installation.

1. ### For x86 & x64 Linux (Only DEB and RPM coz fuck you Brother!)

- Download drivers from [here](https://support.brother.com/g/b/downloadtop.aspx?c=in&lang=en&prod=hll2361dn_as) or [DDL (not recommended)](https://support.brother.com/g/b/downloadhowto.aspx?c=in&lang=en&prod=hll2361dn_as&os=128&dlid=dlf006893_000&flang=4&type3=625)

- Download either "Driver Install Tool" or ("LPR printer driver" and "CUPSwrapper printer driver") and follow the install instructions given on the page.

2. ### For x86 & x64 Arch Based.
- [See this forum](https://forum.manjaro.org/t/brother-l2550-dw-printer-driver-in-deb-or-rpm-but-what-for-arch/29481/3) and as always [THE GREAT ARCH WIKI](https://wiki.archlinux.org/index.php/CUPS/Printer-specific_problems)
	- Install AUR package for [Hl-L2360D](https://aur.archlinux.org/packages/brother-hll2360d/) & [Brlaser](https://aur.archlinux.org/packages/brlaser/)

		1. ```sudo pamac install brother-hll2360d```

		2. ```sudo pamac install brlaser```

		- After building and installing the AUR packages. You should also installed below from pacman,

	    3. ```sudo pacman -S manjaro-printer```

	    4. ```sudo pacman -S system-config-printer```

		```$ system-config-printer``` opens a dialog. Select network printer, and my printer appears. Using the ‘settings’ dialog enter into the Device URI field [socket://10.0.0.49] or whatever the IP address is of the printer. Good idea to make that static through the router. (steps written by some user on Manjaro forum)

3. ### For Rpi

- [Guide for Setup a Print Server](https://medium.com/@anirudhgupta281998/setup-a-print-server-using-raspberry-pi-cups-part-2-2d6d48ccdc32) or [Another Guide](https://www.tomshardware.com/how-to/raspberry-pi-print-server) or [Rpi official Guide](https://www.raspberrypi.org/blog/printing-at-home-from-your-raspberry-pi/) or just Search it on internet.

	- Introduction to CUPS
	CUPS (Common Unix Printing System) is a printing system for UNIX like operating systems based computers. It gives computers on which it is running the ability to act as a print server. A computer running CUPS is able to accept jobs from multiple devices, process them and pass it on to the appropriate printer to print. For this tutorial, we will setup CUPS on a Raspberry Pi 3 Model B+. You can use any other Raspberry Pi model.


- [Guide for drivers](https://medium.com/@alexanderbelov/how-to-use-your-brother-printer-with-cups-on-raspberry-pi-5b712cc2b4e6)
	- [Another guide](https://web.archive.org/web/20200725181408/https://forum.manjaro.org/t/how-to-set-up-a-remote-printer-which-is-attached-to-a-raspberry-pi-or-any-other-arm-computer/57056)
	
	- Although Brother has its own drivers for CUPS, they’re precompiled for x86 (32-bit) architecture. Raspberry Pi is based on ARM arch, so manufactures’ drivers are note compatible with your Pi out of the box.

	Software enthusiast Peter De Wachter has written an alternate driver for Brother’s printers − it’s called «brlaser».

	Source code is available at its [GitHub repo](https://github.com/pdewacht/brlaser).

	Installation is quite simple − just paste this line to Terminal:
	```
	sudo apt-get install printer-driver-brlaser
	sudo service cups restart
	```

	When CUPS will ask you to choose the driver to communicate with your printer, choose «brlaser».

	If you don’t see the exact model of your printer, pick the closest option based on your model’s number. For example, I have an 7060D model. Most close option is 7065 model − most probably that will work like a charm. (use HL-L2360D brlaser for HL-2400CeN)


---

# Pihole.


## Adlists


1.	developerdan, [Website](https://www.github.developerdan.com/hosts/), [Github](https://github.com/lightswitch05/hosts)
2.	oisd domain blocklist , [Website](https://oisd.nl/), [subreddit](https://www.reddit.com/r/oisd_blocklist/)
3.	The Big Blocklist Collection (firebog), [Website](https://firebog.net/), [github](https://github.com/WaLLy3K/wally3k.github.io)

4.	[This is a custom regex filter file for use with Pi-hole](https://github.com/mmotti/pihole-regex)
5.	[Collection of commonly white listed domains](https://github.com/anudeepND/whitelist)

6.	Block Amp, [reddit](https://www.reddit.com/r/pihole/comments/b3fj60/regex_megathread/ej234j1/), [github developerdan](https://www.github.developerdan.com/hosts/lists/amp-hosts-extended.txt)

7.	[Update Pi-hole's lists from remote sources](https://github.com/jacklul/pihole-updatelists)


- All lists URL
	1.	-  https://www.github.developerdan.com/hosts/lists/ads-and-tracking-extended.txt
		- https://www.github.developerdan.com/hosts/lists/amp-hosts-extended.txt

	2. https://dbl.oisd.nl/

	3. https://v.firebog.net/hosts/lists.php?type=tick

	4.	- "^(.+[_.-])?amp(project)?\."  for amp
		- https://github.com/mmotti/pihole-regex/blob/master/regex.list

	5. 	https://raw.githubusercontent.com/anudeepND/whitelist/master/domains/whitelist.txt

	6. 	- https://www.github.developerdan.com/hosts/lists/amp-hosts-extended.txt
		- "^(.+\.)?amp\..+\.com$"

    	- "^(.+\.)?ampproject\.org$"



### Other Adlists Resources

- [Github Thread 1](https://www.reddit.com/r/pihole/comments/dz6fi9/best_block_list/)


- [pihole_adlist_tool](https://github.com/yubiuser/pihole_adlist_tool) (not supported by PiHole devs) audits which lists are actually used. I’ve run this tool and discovered that several lists I added weren’t doing anything at all.
- TheGreatWall, Prevent program and malware to bypass DNS filter by using DoH, [Github](https://github.com/Sekhan/TheGreatWall)
- piholeparser, This Project Aims To Universally take ANY Blacklist, and ensure that it is formatted to be compatible with Pi-hole, [Github](https://github.com/deathbybandaid/piholeparser)


- The Block List Project, [Github](https://github.com/blocklistproject/Lists)
- FTPiHole.com, [Github](https://github.com/ftpmorph/ftpihole)
- BlockConvert, [Github](https://github.com/mkb2091/blockconvert)
- https://filterlists.com/


- [Unlock the full potential of Pihole](https://obutterbach.medium.com/unlock-the-full-potential-of-pihole-e795342e0e36)
- [CDN powered AD filters](https://github.com/bmyjacks/adlists)

#### Jio Blocklist


- just add '.*jio.*' regex for router

OR

```
acs.oss.jio.com

jpdp.jpdc.jiophone.net

uw.wln.ims.jio.com

uw.wln.ccs.jio.com.reliance

uw.wln.ccs.jio.com

cr.acs.oss.jio.com

jcpnv.jio.com

nav.jiobuzz.com

rtss-prod.jioconnect.com

(\.|^)jio\.com$

firebaseremoteconfig.googleapis.com

```
