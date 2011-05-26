#################
# Start .bashrc #
#################

# Much inspiration came from the following sources:
# * https://wiki.archlinux.org/index.php/Core_Utilities

# Set readline's key binding to vi mode (it defaults to emacs..)
set -o vi

PATH="$PATH:$HOME/bin"

# * Source the bash configuration files in $HOME/.bashrc.d
# * Files in this directory must have '.sh' extension to be sourced
# * Currently, there is no guarantee regarding the order in which
#   these files will be sourced. Thus DO NOT write code which relies
#   on the order which the files are sourced. Doing so is bound to
#   cause portability issues. Issue can easily be resolved using a
#   two digit prefix to the filenames, and sorting the list of files;
#   but as of now this extra complexity is completely unnecessary.
for file in `ls $HOME/.bashrc.d/*.sh`; do
	[ -r $file ] && . $file
done

###############
# End .bashrc #
###############
