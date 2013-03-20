#!/bin/bash -e

t2s() {
	echo $1 | tr : ' ' | xargs -n1 | tac | xargs | (
		read s m h d
		echo $(( 10#$s + 10#${m:-0}*60 + 10#${h:-0}*3600 +
			10#${d:-0}*86400))
	)
}

echo -n "Will record in... "
for i in 5 4 3 2 1; do
	echo -n "$i "
	sleep 1
done
echo
echo "Recording now!"

src="$(pactl list | grep -A2 '^Source #' | grep 'Name: .*\.monitor$' | awk '{print $NF}' | tail -n1)"
dest="$1"
shift
secs="$(( `t2s $1` + 15))"
shift
parec -d "$src" --rate=44100 --format=s16le --channels=1 /dev/stdout | \
	lame -V 4 -r -s '44.1' --signed --bitwidth 16 --little-endian -m m "$@" /dev/stdin "$dest" &
pid=$!
sleep $secs
kill $pid
killall parec 2>/dev/null
killall lame 2>/dev/null
