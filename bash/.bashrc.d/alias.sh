#################
# Start Aliases #
#################

# Modified Commands
alias df='df --human-readable'
alias du='du --human-readable'
alias grep='grep --color=auto'
alias mkdir='mkdir --parents --verbose'
alias more='less'
alias ping='ping -c 5'
alias vi='vim'

# ls Specific Commands
alias ls='ls --human-readable --classify --color=always'
alias lr='ls --recursive'
alias ll='ls -l'
alias la='ll --almost-all'
alias lm='la | more'

# New Commands
alias du1='du --max-depth=1'
alias hist='history | grep $1' # Requires an argument

# Misc Shortcut Commands
alias s='ssh'
alias c='clear'
alias g='git'
alias am='alsamixer'

###############
# End Aliases #
###############
