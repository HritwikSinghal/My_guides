# RPI and Pihole.

# ** Table of Contents **
- ** Raspberry Pi **
    - IMP
    	- Remove MS repo
    - Guides
	    - Brother Printer Driver Installation
		    - 1. For x86 & x64 Linux (Only DEB and RPM)
		    - 2. For x86 & x64 Arch Based.
		    - 3. For Rpi
- ** Pihole **
	- Adlists
	- Other Adlists Resources
	- Jio Blocklist


---


# Raspberry Pi


## IMP!
- Remove MS repo from PI (coz Rpi foundation is a jerk)
	- https://www.reddit.com/r/linux/comments/lbu0t1/microsoft_repo_installed_on_all_raspberry_pis/
	- Maybe create a cron script for it.

## Guides


### Brother Printer Driver Installation.

<details><summary>1. For x86 & x64 Linux (Only DEB and RPM)</summary>
<p>

- Download drivers from [here](https://support.brother.com/g/b/downloadtop.aspx?c=in&lang=en&prod=hll2361dn_as) or [DDL (not recommended)](https://support.brother.com/g/b/downloadhowto.aspx?c=in&lang=en&prod=hll2361dn_as&os=128&dlid=dlf006893_000&flang=4&type3=625)

- Download either "Driver Install Tool" or ("LPR printer driver" and "CUPSwrapper printer driver") and follow the install instructions given on the page.


</p>
</details>


<details><summary>2. For x86 & x64 Arch Based.</summary>
<p>

- [See this forum](https://forum.manjaro.org/t/brother-l2550-dw-printer-driver-in-deb-or-rpm-but-what-for-arch/29481/3) and as always [THE GREAT ARCH WIKI](https://wiki.archlinux.org/index.php/CUPS/Printer-specific_problems)
	- Install AUR package for [Hl-L2360D](https://aur.archlinux.org/packages/brother-hll2360d/) & [Brlaser](https://aur.archlinux.org/packages/brlaser/)

		1. ```sudo pamac install brother-hll2360d```

		2. ```sudo pamac install brlaser```

		- After building and installing the AUR packages. You should also installed below from pacman,

	    3. ```sudo pacman -S manjaro-printer```

	    4. ```sudo pacman -S system-config-printer```

		```$ system-config-printer``` opens a dialog. Select network printer, and my printer appears. Using the ‘settings’ dialog enter into the Device URI field [socket://10.0.0.49] or whatever the IP address is of the printer. Good idea to make that static through the router. (steps written by some user on Manjaro forum)

</p>
</details>

<details><summary>3. For Rpi</summary>
<p>

- [[TUTORIAL] Install Brother old drivers in Raspberry PI with QUEMU (pretty easy)](https://www.reddit.com/r/linux/comments/lfaox9/tutorial_install_brother_old_drivers_in_raspberry/)
	```
	Hi, just managed to print from my Android device in my old DCP-197C and I want to share it with you

	I don't know if I miss something, because I tried it so many times, but I want to write somewhere what I did today, when it finally worked:

	INSTALL ALL THE NECESARY STUFF

	apt-get install qemu binfmt-support qemu-user-static cups a2ps

	ADD ARCHITECTURE

	dpkg --add-architecture i386

	DOWNLOAD LIBC6 FOR i386 (I found it here)

	wget old.kali.org/kali-security/pool/main/e/eglibc/libc6_2.13-38+deb7u8_i386.deb

	IF YOU TRY TO INSTALL THIS, YOU WILL MESS AROUND WITH APT, SO WE WILL EXTRACT THE DEB AND COPY THESE FILES MANUALLY

	    dpkg -x libc6_2.13-38+deb7u8_i386.deb data

	    sudo cp -r data/lib/* /lib

	    sudo cp -r data/usr/* /usr

	    sudo cp -r data/etc/* /etc

	RUN THIS AND ADD IT TO BASHRC TO RUN IN EVERY REBOOT

	EXTRA_OPTS="-L /lib/i386-linux-gnu"

	DOWNLOAD AND INSTALL YOUR DRIVERS - FOR ME:

	    wget https://download.brother.com/welcome/dlf005405/dcp197ccupswrapper-1.1.3-1.i386.deb

	    wget https://download.brother.com/welcome/dlf005403/dcp197clpr-1.1.3-1.i386.deb

	    sudo dpkg -i dcp197ccupswrapper-1.1.3-1.i386.deb

	    sudo dpkg -i dcp197clpr-1.1.3-1.i386.deb
	```

- [Other Guide for Setup a Print Server](https://medium.com/@anirudhgupta281998/setup-a-print-server-using-raspberry-pi-cups-part-2-2d6d48ccdc32) or [Another Guide](https://www.tomshardware.com/how-to/raspberry-pi-print-server) or [Rpi official Guide](https://www.raspberrypi.org/blog/printing-at-home-from-your-raspberry-pi/) or just Search it on internet.

	- Introduction to CUPS
	CUPS (Common Unix Printing System) is a printing system for UNIX like operating systems based computers. It gives computers on which it is running the ability to act as a print server. A computer running CUPS is able to accept jobs from multiple devices, process them and pass it on to the appropriate printer to print. For this tutorial, we will setup CUPS on a Raspberry Pi 3 Model B+. You can use any other Raspberry Pi model.


- (Does not work for HL-L2360D)
	- [Guide for drivers](https://medium.com/@alexanderbelov/how-to-use-your-brother-printer-with-cups-on-raspberry-pi-5b712cc2b4e6)
		- [Another source for above guide](https://web.archive.org/web/20200725181408/https://forum.manjaro.org/t/how-to-set-up-a-remote-printer-which-is-attached-to-a-raspberry-pi-or-any-other-arm-computer/57056)

</p>
</details>

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
