(define-module (sherikov release ariles2_jsonnet)
    #:use-module (guix packages)
    #:use-module (guix gexp)
    #:use-module (guix utils)
    #:use-module (gnu packages cpp)
    #:use-module (sherikov release ariles2_core)
)

(define-public ariles2_jsonnet
    (package/inherit ariles2_core
        (name "ariles2_jsonnet")
        (propagated-inputs (list ariles2_core jsonnet))
        (arguments
            (substitute-keyword-arguments
                (package-arguments ariles2_core)
                (
                    (#:configure-flags original-flags)
                    #~(append #$original-flags (list "-DARILES_ENABLE_CORE=OFF" "-DARILES_VISITOR_jsonnet=ON"))
                )
            )
        )
    )
)

ariles2_jsonnet
