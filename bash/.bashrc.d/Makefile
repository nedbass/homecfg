FILES=	00_colors.sh \
	30_git-completion.bash \
	50_alias.sh \
	50_complete.sh \
	50_export.sh

install:
	[ -d ~/.bashrc.d ] || mkdir -m 750 ~/.bashrc.d 2>/dev/null
	for file in $(FILES); do \
		install -C -m 644 $$file ~/.bashrc.d/$$file; \
	done
