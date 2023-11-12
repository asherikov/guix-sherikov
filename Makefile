PKG?=qpmad

chan_install_all:
	ls *.scm | sed 's/\.scm//' | xargs -I {} ${MAKE} chan_install PKG={}

lint_all:
	ls *.scm | sed 's/\.scm//' | xargs -I {} ${MAKE} lint PKG={}

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


guix_purge:
	sudo umount /gnu/store
	systemctl | grep guix | grep -o "[[:graph:]]*.service" | xargs --no-run-if-empty -I {} sudo sh -c "systemctl stop {} && systemctl disable {}"
	sudo find /etc -iname "*guix*" | xargs --no-run-if-empty -I {} sudo rm -Rf {}
	sudo rm -rf /gnu
	sudo rm -rf /var/guix
	rm -rf ~/.profile/guix
	rm -rf ~/.guix-profile

guix_install:
	wget https://git.savannah.gnu.org/cgit/guix.git/plain/etc/guix-install.sh
	sudo sh guix-install.sh

# guix hash -r ./

