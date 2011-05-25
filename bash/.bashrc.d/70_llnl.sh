# Allows the backspace key to work correctly
tty --silent && stty erase '^?'

# This is needed to enable 256 color support in programs such as mutt
TERM=xterm-256color

export PERL5LIB=$PERL5LIB:$HOME/perl/lib/perl5/
export PERL5LIB=$PERL5LIB:$HOME/perl/lib/perl5/site_perl
export PERL5LIB=$PERL5LIB:$HOME/perl/lib64/perl5/
export PERL5LIB=$PERL5LIB:$HOME/perl/lib64/perl5/site_perl
export PERL5LIB=$PERL5LIB:$HOME/perl/share/perl5/
