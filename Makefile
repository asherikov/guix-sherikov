PKG?=qpmad

pkg_install:
	guix package --install-from-file=${PKG}.scm

chan_install:
	guix install --load-path=./ ${PKG}

lint:
	guix lint -x formatting --load-path=./ ${PKG}

show:
	guix show --load-path=./ ${PKG}

chan_add:
	mkdir -p "${HOME}/.config/guix/"
	@echo \
"(cons\n\
    (channel\n\
        (name 'sherikov)\n\
        (url \"https://github.com/asherikov/guix-sherikov\")\n\
        (branch \"main\")\n\
    )\n\
    %default-channels\n\
)" >> "${HOME}/.config/guix/channels.scm"
