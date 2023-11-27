(define-module (sherikov release ariles2_octave)
    #:use-module (guix packages)
    #:use-module (guix gexp)
    #:use-module (guix utils)
    #:use-module (sherikov release ariles2_core)
)

(define-public ariles2_octave
    (package/inherit ariles2_core
        (name "ariles2_octave")
        (propagated-inputs (list ariles2_core))
        (arguments
            (substitute-keyword-arguments
                (package-arguments ariles2_core)
                (
                    (#:configure-flags original-flags)
                    #~(append #$original-flags (list "-DARILES_ENABLE_CORE=OFF" "-DARILES_VISITOR_octave=ON"))
                )
            )
        )
    )
)

ariles2_octave
