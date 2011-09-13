FILES=	.fetchmailrc \
	.muttrc \
	.procmailrc

install:
	for file in $(FILES); do \
		install -C -m 600 $$file ~/$$file; \
	done
