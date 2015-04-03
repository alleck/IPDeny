#!/bin/bash
if [ ! -d "/opt/ipdeny" ]
then
    mkdir /opt/ipdeny
    chmod 755 /opt/ipdeny
fi

read -p "Please enter contry code. (ex. US): " cCode
read -p "Would you like to add new rules or remove existing ones? [1]ADD [2]REMOVE ([1]ADD is default): " action

cCodeLower=$(echo $cCode | awk '{print tolower($0)}')
cCodeUpper=$(echo $cCode | awk '{print toupper($0)}')

if [ $action="2" ] && [ $action ]
then

    cd /opt/ipdeny
    wget -O zones.source -q http://ipdeny.com/ipblocks/data/aggregated/$(echo $cCodeLower)-aggregated.zone

    while read line
    do
        iptables -D INPUT -s $line -j DROP -m comment --comment "IpDeny: $(echo $cCodeUpper)"
    done < zones.source

else

    cd /opt/ipdeny
    wget -O zones.source -q http://ipdeny.com/ipblocks/data/aggregated/$(echo $cCodeLower)-aggregated.zone

    while read line
    do
        iptables -I INPUT -s $line -j DROP -m comment --comment "IpDeny: $(echo $cCodeUpper)"
    done < zones.source

fi