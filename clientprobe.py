#!/usr/bin/python 

import sys
from scapy.all import * 

#usage:./clientsprobes.py wlan0mon 10000` 
#	{./script....     Wifi_interface frames_to_sniff}
# -*- coding: utf-8 -*-


# Console colors
W = '\033[0m'    # white (normal)
R = '\033[31m'   # red
G = '\033[32m'   # green
O = '\033[33m'   # orange
B = '\033[34m'   # blue
P = '\033[35m'   # purple
C = '\033[36m'   # cyan
GR = '\033[37m'  # gray
T = '\033[93m'   # tan

print "      DISCLAIMER -----Refer tO the lawS in your provincE/country before accessing, using,or in any other way utilizing these MatErials.These materials are for educational and research purposes only.Do not attempt to violate the law with anything contained here. If this is your intention, then LEAVE NOW! Neither the authors of this material, or anyone else affiliated in any way, is going to accept responsibility for your actions. oKay now, bE good. Author Onyibe Shalom- secaouse@gmail.com"

clientprobes = set()
count = 1
def PacketHandler(pkt) :

	if pkt.haslayer(Dot11ProbeReq) :

		if len(pkt.info) > 0 : 
			testcase = pkt.addr2 + '---' + pkt.info 
			if testcase not in clientprobes :
				clientprobes.add(testcase) 
				print "New Probe Found:  " + pkt.addr2 + ' ---- ' + pkt.info 


				print "\n------------Client Probes Table ---------------\n"
				counter = 1
				for probe in clientprobes :
					[client, ssid] = probe.split('---')
					print counter, client, ssid
					counter = counter + 1 
				
				print "\n-----------------------------------------------\n"


sniff(iface = sys.argv[1], count = int( sys.argv[2] ), prn = PacketHandler)

for line in clientprobes:
	[client,ssid] = line.split('---') #To print out the captured beacon probes.
	print '\n ' + str(count) + ' ' + client + ' ' + ssid
	count = count + 1

victim = str(raw_input("\n Who's Trust do we compromise ?         Type-in the ESSID of your choice-> "))



print " you selected ", victim


subprocess.Popen(["./handshake.sh", victim])

exit
