(define-module (sherikov release ariles2_rapidjson)
    #:use-module (guix packages)
    #:use-module (guix gexp)
    #:use-module (guix utils)
    #:use-module (gnu packages web)
    #:use-module (sherikov release ariles2_core)
)
  
(define-public ariles2_rapidjson
    (package/inherit ariles2_core
        (name "ariles2_rapidjson")
        (propagated-inputs (list ariles2_core rapidjson))
        (arguments
            (substitute-keyword-arguments
                (package-arguments ariles2_core)
                (
                    (#:configure-flags original-flags)
                    #~(append #$original-flags (list "-DARILES_ENABLE_CORE=OFF" "-DARILES_VISITOR_rapidjson=ON"))
                )
            )
        )
    )
)

ariles2_rapidjson
