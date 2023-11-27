(define-module (sherikov release ariles2_pugixml)
    #:use-module (guix packages)
    #:use-module (guix gexp)
    #:use-module (guix utils)
    #:use-module (gnu packages xml)
    #:use-module (sherikov release ariles2_core)
)

(define-public ariles2_pugixml
    (package/inherit ariles2_core
        (name "ariles2_pugixml")
        (propagated-inputs (list ariles2_core pugixml))
        (arguments
            (substitute-keyword-arguments
                (package-arguments ariles2_core)
                (
                    (#:configure-flags original-flags)
                    #~(append #$original-flags (list "-DARILES_ENABLE_CORE=OFF" "-DARILES_VISITOR_pugixml=ON"))
                )
            )
        )
    )
)

ariles2_pugixml
