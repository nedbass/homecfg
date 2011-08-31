FILES=	.vimrc

DIRS=	.vim

install:
	for file in $(FILES); do \
		install -C -m 644 $$file ~/$$file; \
	done; \
	for dir in $(DIRS); do \
		make -C $$dir install; \
	done
