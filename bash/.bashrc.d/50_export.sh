#############################
# Start Environment Exports #
#############################

export GIT_PS1_SHOWUPSTREAM="verbose" # Used in conjunction with __git_ps1 in
                                      # the $PS1 customization. Used to show
                                      # the difference between HEAD and its
                                      # upstream. "verbose" means, show number
                                      # of commits ahead/behind (+/-) upstream.

# Customize by bash interactive shell prompt
# * \H : Hostname
# * \u : Username of current user
# * \d : Date in "Weekday Month Date" format (e.g. "Tue May 26")
# * \t : Current Time in 24-hour notation (HH:MM:SS)
# * \w : Current working directory, with $HOME abbreviated with ~
# * $(__git_ps1 " (%s)") : Show the name of the current branch if your are
#                          currently in a git repository (depends on the
#                          git-completion.bash file)
export PS1="\[\033[01;34m\]\\$ \[\033[01;32m\] \u@\h \w `tty` \d \t \$(__git_ps1 '(%s)') \[\033[01;34m\]>\[\033[00m\]\n"

export GREP_COLOR='1;33' # Set the color to use when highlighting the matched
                         # part of grep's output (1;33 ~> yellow)
export LESS='-R'

export HISTTIMEFORMAT='%F %T ' # Show the time and date in the history file
                               # %F ~> 2011 - 06 - 21
                               # %T ~> 10 : 21 : 00

export EDITOR='/usr/bin/vim' # I like vim :)

# * Add directories to $PATH which I use as a place to install programs
# * Brief Descriptions:
#    * $HOME/bin - Usually small personal scripts and programs
#    * $HOME/prefix/bin - Manually compiled and installed programs
[ -d "$HOME/bin" ]        && export PATH="$HOME/bin:$PATH"

# Ignore duplicate commands and those with leading whitespace.
HISTCONTROL=ignoreboth
# Max number of lines in history file.
HISTFILESIZE=100000
# Max number of commands.
HISTSIZE=100000

###########################
# End Environment Exports #
###########################
