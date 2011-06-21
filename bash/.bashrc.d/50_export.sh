#############################
# Start Environment Exports #
#############################

# Customize by bash interactive shell prompt
# * \H : Hostname
# * \u : Username of current user
# * \d : Date in "Weekday Month Date" format (e.g. "Tue May 26")
# * \t : Current Time in 24-hour notation (HH:MM:SS)
# * \w : Current working directory, with $HOME abbreviated with ~
# * \n : Newline
# * \$ : If UID is 0, print a '#' character, otherwise print a '$' character
export PS1="$Yellow\H \u \d \t \w\n\$ $Color_Off"

export GREP_COLOR='1;33' # Set the color to use when highlighting the matched
                         # part of grep's output (1;33 ~> yellow)
export LESS='-R'

export HISTTIMEFORMAT='%F %T ' # Show the time and date in the history file
                               # %F ~> 2011 - 06 - 21
                               # %T ~> 10 : 21 : 00

###########################
# End Environment Exports #
###########################
