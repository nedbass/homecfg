FILES=	.tmux.conf

install:
	for file in $(FILES); do \
		install -C -m 640 $$file ~/$$file; \
	done
