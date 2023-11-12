(define-module (ariles2_rapidjson)
  #:use-module (guix packages)
  #:use-module (gnu packages web)
  #:use-module (ariles2_core))

(define-public ariles2_rapidjson
    (package
        (inherit ariles2_core)
        (name "ariles2_rapidjson")
        (propagated-inputs (list ariles2_core rapidjson))
        (arguments
            `(  #:tests? #false
                #:configure-flags '("-DARILES_VISITORS_DEFAULT_MODE=OFF"
                                    "-DARILES_CCACHE=OFF"
                                    "-DARILES_ENABLE_CORE=OFF"
                                    "-DARILES_VISITOR_rapidjson=ON")
            )
        )
    )
)

ariles2_rapidjson
