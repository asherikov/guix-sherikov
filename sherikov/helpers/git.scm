(define-module (sherikov helpers git)
    #:use-module (ice-9 rdelim)
    #:use-module (ice-9 popen)
    #:use-module (guix build utils)
)


(define-public (sherikov-git-describe dir)
    (let*
        (
            (port
                (with-directory-excursion dir
                    (open-input-pipe "git describe --tags --long --dirty --broken"))
                )
            (str
                (read-line port)
            )
        )
        (close-pipe port)
    str)
)

