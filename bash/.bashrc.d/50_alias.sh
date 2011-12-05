#################
# Start Aliases #
#################

unalias -a

alias realias=". $HOME/.bashrc.d/50_alias.sh"

# Modified Commands
alias grep='grep --color=auto'
alias mkdir='mkdir --parents --verbose'
alias emacs="emacs -nw"
alias mv='mv -i'
alias ls='ls --human-readable --classify --color=always'
alias less="less -MXR"
alias view="vim -R"


# New Commands
alias openports='netstat --all --numeric --programs --inet'
alias null='cat > /dev/null'
alias gitl="git log --no-merges"
alias gitb="git branch -a"
# Pick Random element from a stream.
alias pr="perl -ne 'if (!int rand \$s++) {\$n = \$_} END {print \$n}'"
alias findc="find $1 -name '*.[ch]'"
alias ibmvpn="ssh -t sl-vm sudo /opt/agns/bin/NetVPN.sh"
alias ssue="perl -e 'print scalar localtime \$ARGV[0], \"\n\"'"

# Misc Shortcut Commands
alias s='ssh'
alias g='git'

###############
# End Aliases #
###############
