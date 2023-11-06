PKG?=qpmad

pkg_install:
	guix package --install-from-file=${PKG}.scm

chan_install:
	guix install --load-path=./ ${PKG}

lint:
	guix lint -x formatting --load-path=./ ${PKG}

show:
	guix show --load-path=./ ${PKG}
