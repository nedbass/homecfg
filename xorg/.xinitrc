xrdb -merge ~/.Xresources
xset b off

while true; do
	date=$(date +"%a %b %d %T")
	xsetroot -name "$date"
	sleep 1s
done &

exec dwm
