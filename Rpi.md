# For x86 & x64 Linux

- Download drivers from [here](https://support.brother.com/g/b/downloadtop.aspx?c=in&lang=en&prod=hll2361dn_as) or [DDL (not recommended)](https://support.brother.com/g/b/downloadhowto.aspx?c=in&lang=en&prod=hll2361dn_as&os=128&dlid=dlf006893_000&flang=4&type3=625)

- Download either "Driver Install Tool" or ("LPR printer driver" and "CUPSwrapper printer driver") and follow the install instructions given on the page.

# For Rpi

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
