FILES=	.bashrc \
	.bash_profile

DIRS=	.bashrc.d

install:
	for file in $(FILES); do \
		install -C -m 640 $$file ~/$$file; \
	done; \
	for dir in $(DIRS); do \
		make -C $$dir install; \
	done
