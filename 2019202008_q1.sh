#!/bin/bash

if [[ "$#" -eq 1 ]] ; then
	cityname=$1
	#curl wttr.in/"$cityname"
	latitude=`grep -E -w -i "$cityname" worldcities.csv | cut -d "," -f3 | sed 's/["]*//g'`
	longitude=`grep -E -w -i "$cityname" worldcities.csv | cut -d "," -f4 | sed 's/["]*//g'`
	wget -o log.txt -O temp.txt https://darksky.net/forecast/"$latitude","$longitude"/us12/en
	grep -E "summary swap" temp.txt | cut -d ">" -f 2 | cut -d "&" -f  1
	grep -E "summary swap" temp.txt | cut -d ">" -f 2 | cut -d ";" -f  2| cut -d "<" -f 1
fi
if [[ "$#" -eq 2 ]] ; then
	latitude=$1
	longitude=$2
	wget -o log.txt -O temp.txt https://darksky.net/forecast/"$latitude","$longitude"/us12/en
	grep -E "summary swap" temp.txt | cut -d ">" -f 2 | cut -d "&" -f  1
	grep -E "summary swap" temp.txt | cut -d ">" -f 2 | cut -d ";" -f  2| cut -d "<" -f 1
fi
