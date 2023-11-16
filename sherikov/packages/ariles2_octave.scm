(define-module (sherikov packages ariles2_octave)
  #:use-module (guix packages)
  #:use-module (sherikov packages ariles2_core))

(define-public ariles2_octave
    (package
        (inherit ariles2_core)
        (name "ariles2_octave")
        (propagated-inputs (list ariles2_core))
        (arguments
            `(  #:tests? #false
                #:configure-flags '("-DARILES_VISITORS_DEFAULT_MODE=OFF"
                                    "-DARILES_CCACHE=OFF"
                                    "-DARILES_ENABLE_CORE=OFF"
                                    "-DARILES_VISITOR_octave=ON")
            )
        )
    )
)

ariles2_octave
