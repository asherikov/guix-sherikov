(define-module (sherikov release ariles2_yaml_cpp)
    #:use-module (guix packages)
    #:use-module (guix gexp)
    #:use-module (guix utils)
    #:use-module (gnu packages serialization)
    #:use-module (sherikov release ariles2_core)
)

(define-public ariles2_yaml_cpp
    (package/inherit ariles2_core
        (name "ariles2_yaml_cpp")
        (propagated-inputs (list ariles2_core yaml-cpp))
        (arguments
            (substitute-keyword-arguments
                (package-arguments ariles2_core)
                (
                    (#:configure-flags original-flags)
                    #~(append #$original-flags (list "-DARILES_ENABLE_CORE=OFF" "-DARILES_VISITOR_yaml_cpp=ON"))
                )
            )
        )
    )
)

ariles2_yaml_cpp
