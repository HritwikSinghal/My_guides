# Things Saved, generally bookmarks that i've stored.


# ** Table of Contents **
- General
- Linux
- RPI
	- Nextcloud
	- File storage server on Pi
- Android
- Python
    - Build LOS
- FF
- Self-Host
- Extra




---


## 1. General

- [rpi things](https://www.youtube.com/watch?v=t3pwiFKGHMg)

- [for downloading videos](https://alltubedownload.net/)
    - supports voot, sony liv, hotstar

- Games
	- Titanfall 2

- [ffsubsync: Automagically synchronize subtitles with video](https://github.com/smacke/ffsubsync)

- [TheFrenchGhosty's Ultimate YouTube-DL Scripts Collection](https://github.com/TheFrenchGhosty/TheFrenchGhostys-Ultimate-YouTube-DL-Scripts-Collection)

- [[MODULE] Smali Patcher for native Android (Termux) | XDA Developers Forums](https://forum.xda-developers.com/t/module-smali-patcher-for-native-android-termux.4183061/)
	- [Gitlab](https://gitlab.com/JFronny/smalipatcher/)


- QEMU
	- https://github.com/qemu/qemu/search?q=harddisk
	- https://github.com/SafeExamBrowser/seb-win-refactoring/blob/master/SafeExamBrowser.SystemComponents/VirtualMachineDetector.cs#L19
	- https://github.com/SafeExamBrowser/seb-win/blob/2199f9d167fb05b9b869bebd86a2df61352c0bb0/SebWindowsClient/SebWindowsClient/SebWindowsClientMain.cs#L264
	- https://blog.prowling.nu/2012/09/modifying-kvm-qemu-kvm-settings-for.html
	- https://wiki.qemu.org/Hosts/Linux
	- https://www.google.com/search?q=compile+qemu+ubuntu
	- https://wiki.qemu.org/index.php?title=Hosts/Linux&action=edit
	- https://gns3.com/community/blog/how-to-compile-qemu-2-2-0-in-ubu
	- https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/virtualization_deployment_and_administration_guide/sect-guest_virtual_machine_disk_access_with_offline_tools-using_virt_customize
	- https://developers.redhat.com/blog/2020/03/06/configure-and-run-a-qemu-based-vm-outside-of-libvirt/
	- https://www.google.com/search?q=qemu+change+directory
	- https://www.google.com/search?q=compile+qemu+to+usr%2Fbin
	- https://www.reddit.com/r/VFIO/comments/9pi2cd/how_to_set_up_qemu_30_on_ubuntu_1804/
	- https://help.ubuntu.com/community/AppArmor
	- https://phoenixnap.com/kb/grep-command-linux-unix-examples
	- https://www.digitalocean.com/community/tutorials/using-grep-regular-expressions-to-search-for-text-patterns-in-linux
	- https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/virtualization_deployment_and_administration_guide/sect-manipulating_the_domain_xml-smbios_system_information
	- https://blog.prowling.nu/2012/09/modifying-kvm-qemu-kvm-settings-for.html
	- https://askubuntu.com/questions/58321/how-do-i-install-glib
	- https://gns3.com/community/blog/how-to-compile-qemu-2-2-0-in-ubu
	- https://askubuntu.com/questions/1123697/where-are-image-files-for-gnome-boxes-stored
	- https://github.com/nsmfoo/antivmdetection
	- https://www.guyrutenberg.com/2018/10/25/sharing-a-folder-a-windows-guest-under-virt-manager/

---



## 1. Linux


- [Linux Wifi Hotspot](https://github.com/lakinduakash/linux-wifi-hotspot)
- [login with USB on liunx](https://www.linuxuprising.com/2021/02/how-to-login-with-usb-flash-drive.html)


- [Display media info in nemo](https://www.linuxuprising.com/2018/08/display-extensive-media-information-in.html)

- [cut m4a audio](https://superuser.com/questions/140899/ffmpeg-splitting-mp4-with-same-quality)


- Timeshift will fuck up windows bootloader if you restore it back to an old windows bootloader installation
    - [FIX](https://thegeekpage.com/bootrec-fixboot-access-is-denied/)


- [schedule-commands-and-scripts-in-linux](https://www.linuxuprising.com/2020/10/schedule-commands-and-scripts-in-linux.html)
- https://www.linuxuprising.com/2020/01/bandwhich-shows-whats-taking-up-your.html
- https://www.linuxuprising.com/2020/05/how-to-encrypt-cloud-storage-files-with.html
- [cryptomator](https://www.linuxuprising.com/2020/04/cryptomator-150-released-with.html)
- [borg backup](https://medium.com/swlh/backing-up-with-borg-c6f13d74dd6)


- [free-up-port-53 in ubuntu](https://www.linuxuprising.com/2020/07/ubuntu-how-to-free-up-port-53-used-by.html)
    - https://askubuntu.com/questions/973017/wrong-nameserver-set-by-resolvconf-and-networkmanager


- [TLP, extend battery linux](https://www.linuxuprising.com/2020/02/tlp-13-linux-laptop-battery-extender.html)


- [launch-startup-applications](https://www.linuxuprising.com/2020/11/how-to-launch-startup-applications-with.html)


- Brother Printer
    - [Arch Wiki](https://wiki.archlinux.org/index.php/Packaging_Brother_printer_drivers)
    - [LPR vs Cups](https://askubuntu.com/questions/383515/whats-the-difference-between-lpr-and-cupswrapper-drivers-how-to-install-printe)
    - https://aur.archlinux.org/packages/brother-hll2360d/

---




## 1. RPI


- [Building a PiHole for Privacy and Performance (From Flashing SD to Unbound config. Fail2Ban, Firewall, RPi-Monitor.)](https://thesmashy.medium.com/building-a-pihole-for-privacy-and-performance-f762dbcb66e5)

- [open source face recognition Raspberry Pi camera](https://github.com/SharpAI/DeepCamera)

- [self-host Bitwarden Password Manager](https://bowlerdesign.tech/posts/how-to-self-host-bitwarden-on-ubuntu-server/)

- [Monitor your local network using a Raspberry Pi and NEMS](https://howchoo.com/pi/raspberry-pi-network-monitor-setup)

- [Quick Raspberry Pi SSH access over the internet
](https://www.reddit.com/r/raspberry_pi/comments/kwh481/quick_raspberry_pi_ssh_access_over_the_internet/)


### Nextcloud on Pi


- [Install Nextcloud on a RaspberryPi With Docker! Easy 5 Steps](https://www.youtube.com/watch?v=RkJuAGCKsUQ)
- Create your own private cloud on Raspberry Pi, [Medium Link]](https://zahidmak.medium.com/create-your-own-private-cloud-using-raspberry-pi-for-your-photos-and-documents-86a3b60384a0), [Reddit link](https://www.reddit.com/r/raspberry_pi/comments/k6n25f/wrote_this_step_by_step_guide_to_create_your_own/)
- [Nextcloud + Raspberry Pi + Docker + Onion service](https://itnext.io/nextcloud-docker-raspberry-pi-onion-service-84d4af13f7e6)
- ["Best guide I’ve seen for setting up your own Nextcloud server"](https://kevq.uk/how-to-setup-a-nextcloud-server-in-ubuntu)



### File storage server on Pi


- [NASPi: a Raspberry Pi Server](https://www.reddit.com/r/raspberry_pi/comments/i9o0qw/naspi_a_raspberry_pi_server/)
- ["Just wanted to show the Raspberry Pi NAS I've been running for about a year now"](https://www.reddit.com/r/raspberry_pi/comments/htjrir/just_wanted_to_show_the_raspberry_pi_nas_ive_been/)

- Create a nas with rpi using multiple HDD


---



## 1. Android

- [build LineageOS with Nix using robotnix](https://www.reddit.com/r/LineageOS/comments/igg7mc/you_can_now_build_lineageos_with_nix_using/)
    - See LOS reddit wiki for more


---



## 1. Python

- [7 pytest Features and Plugins That Will Save You Tons of Time](https://miguendes.me/7-pytest-features-and-plugins-that-will-save-you-tons-of-time-ckfsjlr8y02axv6s1f8is1pgh)

- [A Comprehensive Guide to Profiling Python Programs](https://medium.com/better-programming/a-comprehensive-guide-to-profiling-python-programs-f8b7db772e6)




---



## 1. FF

### Shortcuts

- https://www.reddit.com/r/firefox/comments/l74kds/im_too_old_to_relearn_ctrlshifto_any_help/ : see comments

- https://www.reddit.com/r/firefox/comments/k7wvzc/vanilla_firefox_keyboard_mastery/

- [public table of Firefox's keyboard shortcuts](https://www.reddit.com/r/firefox/comments/jj91qb/i_created_a_public_table_of_firefoxs_keyboard/)

### Smooth scrolling

- https://www.reddit.com/r/firefox/comments/lequ4j/what_are_some_aboutconfig_settings_to_make_the/ : see comments

- https://www.reddit.com/r/firefox/comments/lev5wy/natural_smooth_scrolling/



---



## 1. Extra


- [Full guide for installing KSP on linux for 64bit performance [X-post /r/KerbalSpaceProgram] : KerbalAcademy](https://www.reddit.com/r/KerbalAcademy/comments/3fdmv3/full_guide_for_installing_ksp_on_linux_for_64bit/)

- [7 Tips To Book Cheap Flight Tickets For Your Trek - Indiahikes](https://indiahikes.com/tips-cheap-flight-tickets-india/)