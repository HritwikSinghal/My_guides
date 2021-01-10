# Adlists for Pihole


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



# Other Resources

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

# Jio Blocklist
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
