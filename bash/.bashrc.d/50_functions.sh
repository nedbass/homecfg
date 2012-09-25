# Print paragraph containing $1 in file $2.
pgrep () {
	SEARCH_STRING=$1 perl -n00e 'print if /$ENV{SEARCH_STRING}/' $2
}

rpm_extract_files () { rpm2cpio "$1" | cpio -i --make-directories; }

rpm_full_listing () {
	typeset format="[%{FILEMODES:perms} %-8{FILEUSERNAME} %-8{FILEGROUPNAME}"
	format="$format %10{FILESIZES} %{FILEMTIMES:date} %{FILENAMES} ->"
	format="$format %{FILELINKTOS}\n]"
	rpm --qf="$format" -q "$@" |
	awk '{if ($1 !~ /^l/) { sub(" -> $", "") } print}'
}

# Edit journal entry.
j () {
	pushd ~/journal > /dev/null 2>&1
	file=entry.`date +%Y%m%d`
	if [ ! -e $file ] ; then
		date > $file
	fi
	vim $file
	popd > /dev/null 2>&1
}

restart_devilspie () {
	killall devilspie
	( devilspie < /dev/null > /dev/null 2>&1 & )
}

strerror () {
	perl -MPOSIX -e 'printf "%s\n", strerror($ARGV[0])' $1
}

# Compute and print unique site password using master passcode.
pass () {
	echo -n "passcode: "
	stty -echo
	read pass
	stty echo
	echo
	if [ -n "$1" ] ; then
		site=$1
	else
		echo -n "site: "
		read site
	fi
	if [ -n "$2" ] ; then
		len=$2
	else
		echo -n "length: "
		read len
	fi
	echo $site.$pass | openssl sha1 -binary| openssl enc -a |
		cut -c 1-$len | tr -d =
}

gg () {
	if [ -n "$1" ] ; then
		vim -c "GitGrep '$1'"
	else
		echo "Usage: gg <expression>"
	fi
}

map () {
	local f=$1
	local x

	shift
	while [ $# -gt 0 ] ; do
		x=$1
		shift
		$f $x
	done
}
