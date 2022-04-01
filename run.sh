#!/bin/bash
#coded by 0xbit
rm .link.log >> /dev/null 2>&1 &
./cloudflared tunnel -url 127.0.0.1:8080 --logfile .link.log > /dev/null 2>&1 &
sleep 10
link=$(grep -o 'https://[-0-9a-z]*\.trycloudflare.com' ".link.log") 
echo -e "\n [-]LINK : $link"
echo -e ""

