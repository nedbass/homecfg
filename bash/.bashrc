#################
# Start .bashrc #
#################

# Much inspiration came from the following sources:
# * https://wiki.archlinux.org/index.php/Core_Utilities
# * https://wiki.archlinux.org/index.php/Bash

# Set readline's key binding to vi mode (it defaults to emacs..)
set -o vi

# Disable flow control. When screen locks up when 'Ctrl-a s' is entered
# during an ssh session if flow control is enabled. The test ensures it
# is only run if stdin is a terminal
[ -t 0 ] && stty -ixon -ixoff

# * Source the bash configuration files in $HOME/.bashrc.d
# * Files in this directory must have a '.sh' or a '.bash' extension to be
#   sourced
# * Files must also be prefixed by a two digit number. This number
#   specifies the order in which the files are sourced (lower numbered
#   prefixes being sourced first).
# * If a file does not conform to the above constraints, the results are
#   undefined.
for file in `ls $HOME/.bashrc.d/*.sh $HOME/.bashrc.d/*.bash | sort -n`; do
	[ -r $file ] && . $file
done
unset file

###############
# End .bashrc #
###############
