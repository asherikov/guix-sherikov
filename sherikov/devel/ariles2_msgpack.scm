(define-module (sherikov devel ariles2_msgpack)
    #:use-module (guix packages)
    #:use-module (guix gexp)
    #:use-module (gnu packages serialization)
    #:use-module (sherikov helpers git)
    #:use-module (sherikov release ariles2_msgpack)
)

(define-public ariles2_msgpack-devel
    (package/inherit ariles2_msgpack
        (name "ariles2_msgpack-devel")
        (propagated-inputs (list ariles2_core-devel msgpack))
        (version (sherikov-git-describe "./src/ariles"))
        (source
            (local-file "../../src/ariles"
                #:recursive? #t
            )
        )
    )
)

ariles2_msgpack-devel
