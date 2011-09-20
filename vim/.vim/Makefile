FILES=	colors/wombat256mod.vim \
	colors/wombat256.vim \
	colors/zenburn.vim \
	plugin/cscope_maps.vim \
	plugin/git-grep.vim

install:
	[ -d ~/.vim ] || mkdir -m 750 ~/.vim
	for file in $(FILES); do \
		install -C -m 644 -D $$file ~/.vim/$$file; \
	done
