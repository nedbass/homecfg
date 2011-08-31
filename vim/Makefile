FILES=	.vimrc

DIRS=	.vim

install:
	for file in $(FILES); do \
		install -C -m 640 $$file ~/$$file; \
	done; \
	for dir in $(DIRS); do \
		make -C $$dir install; \
	done
