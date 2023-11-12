(define-module (ariles2_jsonnet)
  #:use-module (guix packages)
  #:use-module (gnu packages cpp)
  #:use-module (ariles2_core))

(define-public ariles2_jsonnet
    (package
        (inherit ariles2_core)
        (name "ariles2_jsonnet")
        (propagated-inputs (list ariles2_core jsonnet))
        (arguments
            `(  #:tests? #false
                #:configure-flags '("-DARILES_VISITORS_DEFAULT_MODE=OFF"
                                    "-DARILES_CCACHE=OFF"
                                    "-DARILES_ENABLE_CORE=OFF"
                                    "-DARILES_VISITOR_jsonnet=ON")
            )
        )
    )
)

ariles2_jsonnet
