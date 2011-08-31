FILES=	config

install:
	for file in $(FILES); do \
		install -C -m 400 $$file ~/.ssh/$$file; \
	done;
