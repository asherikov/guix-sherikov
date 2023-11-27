(define-module (sherikov release ariles2_msgpack)
    #:use-module (guix packages)
    #:use-module (guix gexp)
    #:use-module (guix utils)
    #:use-module (gnu packages serialization)
    #:use-module (sherikov release ariles2_core)
)

(define-public ariles2_msgpack
    (package/inherit ariles2_core
        (name "ariles2_msgpack")
        (propagated-inputs (list ariles2_core msgpack))
        (arguments
            (substitute-keyword-arguments
                (package-arguments ariles2_core)
                (
                    (#:configure-flags original-flags)
                    #~(append #$original-flags (list "-DARILES_ENABLE_CORE=OFF" "-DARILES_VISITOR_msgpack=ON"))
                )
            )
        )
    )
)

ariles2_msgpack
