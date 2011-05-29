#######################
# Start .bash_profile #
#######################

# The .bashrc file contains all of the interesting stuff.
# On login (which is when this script is run), just source that file at let it
# do the heavy lifting.
source $HOME/.bashrc

# For a bit of fun.. If the programs cowsay and fortune are installed, use
# these programs to print some ascii art on login. But, only do this if it's
# an interactive session; the check on $PS1 ensures this.
if [ -n "$PS1" -a -n "$(type -P cowsay)" -a -n "$(type -P fortune)" ]; then
	# grep removes the initial line consisting of the directory path
	# containing the files.
	files=(`cowsay -l | grep -v :`) # Create array with list of cowfiles
	# Pick a random entry from the array to use as the cowfile
	cowsay -f ${files[$(($RANDOM % ${#files[@]}))]} `fortune -a`
	echo
	unset files
fi

#####################
# End .bash_profile #
#####################
