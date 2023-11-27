(define-module (sherikov devel ariles2_namevalue)
    #:use-module (guix packages)
    #:use-module (guix gexp)
    #:use-module (sherikov helpers git)
    #:use-module (sherikov release ariles2_namevalue)
)

(define-public ariles2_namevalue-devel
    (package/inherit ariles2_namevalue
        (name "ariles2_namevalue-devel")
        (propagated-inputs (list ariles2_core-devel))
        (version (sherikov-git-describe "./src/ariles"))
        (source
            (local-file "../../src/ariles"
                #:recursive? #t
            )
        )
    )
)

ariles2_namevalue-devel
