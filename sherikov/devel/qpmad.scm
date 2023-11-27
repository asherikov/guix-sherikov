(define-module (sherikov devel qpmad)
    #:use-module (guix licenses)
    #:use-module (guix packages)
    #:use-module (guix build-system cmake)
    #:use-module (guix git-download)
    #:use-module (guix gexp)
    #:use-module (gnu packages algebra)
    #:use-module (sherikov helpers git)
    #:use-module (sherikov release qpmad)
)

(define-public qpmad-devel
    (package
        (inherit qpmad)
        (name "qpmad-devel")
        (version (sherikov-git-describe "./src/qpmad"))
        (source
            (local-file "../../src/qpmad"
                #:recursive? #t
            )
        )
    )
)

qpmad-devel
