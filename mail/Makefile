FILES=	.fetchmailrc \
	.procmailrc

install:
	for file in $(FILES); do \
		install -C -m 644 $$file ~/$$file; \
	done
