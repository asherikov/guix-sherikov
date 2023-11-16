PKG?=qpmad
APT_INSTALL?=env DEBIAN_FRONTEND=noninteractive apt --yes --no-install-recommends install

chan_install_all:
	ls sherikov | sed 's/\.scm//' | xargs -I {} ${MAKE} chan_install PKG={}

lint_all:
	ls sherikov | sed 's/\.scm//' | xargs -I {} ${MAKE} lint PKG={}

pkg_install:
	guix package --install-from-file=${PKG}.scm

chan_install:
	guix install --keep-failed --verbosity=20 --load-path=./ ${PKG}

lint:
	# name -- requires '-' instead of '_', whichs is a pain to maintain
	# cve -- useless
	# formatting -- I prefer my own style
	# source -- ??? may help with "'https://archive.softwareheritage.org/api/1/snapshot/.../' returned 500"
	guix lint -x name,cve,formatting,source --load-path=./ ${PKG} | grep ${PKG} | tee lint.err
	test ! -s 'lint.err'
	rm 'lint.err'

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
	systemctl | grep guix | grep -o "[[:graph:]]*.service" | xargs --no-run-if-empty -I {} sudo sh -c "systemctl stop {} && systemctl disable {}"
	sudo umount /gnu/store || true
	sudo find /etc -iname "*guix*" | xargs --no-run-if-empty -I {} sudo rm -Rf {}
	sudo rm -rf /gnu
	sudo rm -rf /var/guix
	rm -rf ~/.profile/guix
	rm -rf ~/.guix-profile

guix_install:
	wget https://git.savannah.gnu.org/cgit/guix.git/plain/etc/guix-install.sh
	sudo sh guix-install.sh

guix_install_noninteractive:
	wget https://git.savannah.gnu.org/cgit/guix.git/plain/etc/guix-install.sh
	yes | sudo sh ./guix-install.sh

guix_update:
	guix pull
	echo 'export PATH="$${HOME}/.config/guix/current/bin:$${PATH}"' >> ~/.bashrc

# guix hash -r ./

