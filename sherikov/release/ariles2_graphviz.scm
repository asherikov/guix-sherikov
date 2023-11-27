(define-module (sherikov release ariles2_graphviz)
    #:use-module (guix packages)
    #:use-module (guix gexp)
    #:use-module (guix utils)
    #:use-module (sherikov release ariles2_core)
)

(define-public ariles2_graphviz
    (package/inherit ariles2_core
        (name "ariles2_graphviz")
        (propagated-inputs (list ariles2_core))
        (arguments
            (substitute-keyword-arguments
                (package-arguments ariles2_core)
                (
                    (#:configure-flags original-flags)
                    #~(append #$original-flags (list "-DARILES_ENABLE_CORE=OFF" "-DARILES_VISITOR_graphviz=ON"))
                )
            )
        )
    )
)

ariles2_graphviz
