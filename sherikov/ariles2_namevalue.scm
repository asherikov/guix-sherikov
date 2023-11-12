(define-module (sherikov ariles2_namevalue)
  #:use-module (guix packages)
  #:use-module (sherikov ariles2_core))

(define-public ariles2_namevalue
    (package
        (inherit ariles2_core)
        (name "ariles2_namevalue")
        (propagated-inputs (list ariles2_core))
        (arguments
            `(  #:tests? #false
                #:configure-flags '("-DARILES_VISITORS_DEFAULT_MODE=OFF"
                                    "-DARILES_CCACHE=OFF"
                                    "-DARILES_ENABLE_CORE=OFF"
                                    "-DARILES_VISITOR_namevalue=ON")
            )
        )
    )
)

ariles2_namevalue
