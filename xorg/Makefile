FILES=	.xsession \
	.xsession_local

install:
	for file in $(FILES); do \
		install -C -m 640 $$file ~/$$file; \
	done;
