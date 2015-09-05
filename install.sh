#! /bin/bash
# Programming and idea by : E2MA3N [Iman Homayouni]
# Email : e2ma3n@Gmail.com
# Website : http://OSLearn.ir
# License : GPL v3.0
# Gcheck v1.0
#####################################################

function check_zenity {
	zenity --help &> /dev/null
	if [ "$?" != "0" ];then
		echo '[-] Please install zenity'
		exit
	fi
} ; check_zenity

function check_curl {
	curl --help &> /dev/null
	if [ "$?" != "0" ];then
		echo '[-] Please install curl'
		exit
	fi
} ; check_curl

function check_shc {
	Q0=1
	shc --help &> /dev/null
	if [ "$?" != "0" ];then
		echo '[-] Warning : shc is not install'
		echo '[-] You can not encrypt Gcheck.sh'
		read -p '[-] Please install shc and try again [ctrl+c to exit or press enter to continue with out encryption]'
		Q0=0
	fi
} ; check_shc

function encrypt {
	shc -f Gcheck.sh
	rm Gcheck.sh
}


reset ; echo '[+] welcome to Gcheck installer'
echo '[+] Programming and idea by : E2MA3N [Iman Homayouni]'
echo '[+] Please check source code ;)' ; echo '[+]'
read -p '[+] Enter Gname (username) : ' username
read -p '[+] Enter Gpass (password) : ' password
if [ "$Q0" = "1" ];then
	read -p '[+] Do you want to encrypt Gcheck.sh ? [y/n] : ' Q1
fi
echo '[+]' ; echo '[+] Creating Gcheck core file ...'

echo "#! /bin/bash" > Gcheck.sh
echo "# Programming and idea by : E2MA3N [Iman Homayouni]" >> Gcheck.sh
echo "# Email : e2ma3n@Gmail.com" >> Gcheck.sh
echo "# Website : http://OSLearn.ir" >> Gcheck.sh
echo "# License : GPL v3.0" >> Gcheck.sh
echo "# Gcheck v1.0" >> Gcheck.sh
echo "#####################################################" >> Gcheck.sh
echo "user=$username" >> Gcheck.sh
echo "pass=$password" >> Gcheck.sh
echo "#####################################################" >> Gcheck.sh
echo "" >> Gcheck.sh
echo "j=0 ; for ((;;)) ; do" >> Gcheck.sh
echo 'sleep 210 ; n=`curl -u $user:$pass --silent 'https://mail.google.com/mail/feed/atom' | cut -d ">" -f 8 | cut -d "<" -f 1`' >> Gcheck.sh
echo "" >> Gcheck.sh
echo 'if [ "$n" -gt "$j" ]; then' >> Gcheck.sh
echo '               zenity --timeout=180 --notification --text "You have $n unread email"' >> Gcheck.sh
echo 'fi ; j=$n ; done' >> Gcheck.sh

if [ "$Q0" = "1" ];then
if [ "$Q1" = "y" ];then
	encrypt
	echo '[+] Gchecl.sh wase encrypted'
elif [ "$Q1" = "n" ];then
	echo '[+] Gcheck.sh wase not encrypted'
else
	echo '[+] Bad input, try y or n'
	echo '[+] Gcheck.sh wase not encrypted'
fi ; fi
echo '[+] Finish'
