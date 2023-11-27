(define-module (sherikov devel ariles2_core)
    #:use-module (guix licenses)
    #:use-module (guix packages)
    #:use-module (guix build-system cmake)
    #:use-module (guix git-download)
    #:use-module (guix gexp)
    #:use-module (gnu packages algebra)
    #:use-module (gnu packages boost)
    #:use-module (sherikov helpers git)
    #:use-module (sherikov release ariles2_core)
)

(define-public ariles2_core-devel
    (package/inherit ariles2_core
        (name "ariles2_core-devel")
        (version (sherikov-git-describe "./src/ariles"))
        (source
            (local-file "../../src/ariles"
                #:recursive? #t
            )
        )
    )
)

ariles2_core-devel
