FILES=	.fetchmailrc \
	.muttrc \
	.procmailrc

install:
	[ -d ~/bin ] || mkdir ~/bin
	for file in * ; do \
		install -C -m 750 $$file ~/bin$$file; \
	done
