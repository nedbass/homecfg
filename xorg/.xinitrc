while true; do
	batt=$(acpi -b | awk '{ print $3, $4 }' | tr -d ',')
	date=$(date +"%a %b %d %r")
	xsetroot -name "$batt $date"
	sleep 1s
done &

exec dwm
