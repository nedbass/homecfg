DIRS=	bash \
	bin \
	git \
	mutt \
	screen \
	ssh \
	vim \
	xorg

install:
	@for dir in $(DIRS); do \
		make -C $$dir install ;\
	done
