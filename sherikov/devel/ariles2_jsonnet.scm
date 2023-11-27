(define-module (sherikov devel ariles2_jsonnet)
    #:use-module (guix packages)
    #:use-module (guix gexp)
    #:use-module (gnu packages cpp)
    #:use-module (sherikov helpers git)
    #:use-module (sherikov release ariles2_jsonnet)
)

(define-public ariles2_jsonnet-devel
    (package/inherit ariles2_jsonnet
        (name "ariles2_jsonnet-devel")
        (propagated-inputs (list ariles2_core-devel jsonnet))
        (version (sherikov-git-describe "./src/ariles"))
        (source
            (local-file "../../src/ariles"
                #:recursive? #t
            )
        )
    )
)

ariles2_jsonnet-devel
