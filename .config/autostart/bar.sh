#!/usr/bin/env bash


while true; do
        date '+  %a %d %b   %R ' > /tmp/CurTime.tmp
        sleep 15s
done &

while true; do

		LOCALTIME=$(echo $(< /tmp/CurTime.tmp))
		CMUS=$(prepend_zero () {
        seq -f "%02g" $1 $1
}

artist=$(echo -n $(cmus-remote -C status | grep "tag artist" | cut -c 12-))

if [[ $artist = *[!\ ]* ]]; then
        song=$(echo -n $(cmus-remote -C status | grep title | cut -c 11-))
        position=$(cmus-remote -C status | grep position | cut -c 10-)
        minutes1=$(prepend_zero $(($position / 60)))
        seconds1=$(prepend_zero $(($position % 60)))
        duration=$(cmus-remote -C status | grep duration | cut -c 10-)
        minutes2=$(prepend_zero $(($duration / 60)))
        seconds2=$(prepend_zero $(($duration % 60)))
        echo -n "$artist - $song [$minutes1:$seconds1/$minutes2:$seconds2]"
else
        echo
		fi)

		MEM=$(echo $(free -h --kilo | awk '/^Mem:/ {print $3 "/" $2}'))
		CPU=$(echo " "$[100-$(vmstat 1 2|tail -1|awk '{print $15}')]"%")

        xsetroot -name " $MEM | $CPU | $LOCALTIME " 
        sleep 15s
done &
