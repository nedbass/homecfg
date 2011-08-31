DIRS=	bash \
	bin \
	devilspie \
	emacs \
	git \
	mail \
	screen \
	ssh \
	vim \
	xorg

install:
	@for dir in $(DIRS); do \
		make -C $$dir install ;\
	done
