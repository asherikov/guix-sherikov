(define-module (sherikov release ariles2_namevalue)
    #:use-module (guix packages)
    #:use-module (guix gexp)
    #:use-module (guix utils)
    #:use-module (sherikov release ariles2_core)
)

(define-public ariles2_namevalue
    (package/inherit ariles2_core
        (name "ariles2_namevalue")
        (propagated-inputs (list ariles2_core))
        (arguments
            (substitute-keyword-arguments
                (package-arguments ariles2_core)
                (
                    (#:configure-flags original-flags)
                    #~(append #$original-flags (list "-DARILES_ENABLE_CORE=OFF" "-DARILES_VISITOR_namevalue=ON"))
                )
            )
        )
    )
)

ariles2_namevalue
