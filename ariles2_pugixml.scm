(define-module (ariles2_pugixml)
  #:use-module (guix packages)
  #:use-module (gnu packages xml)
  #:use-module (ariles2_core))

(define-public ariles2_pugixml
    (package
        (inherit ariles2_core)
        (name "ariles2_pugixml")
        (propagated-inputs (list ariles2_core pugixml))
        (arguments
            `(  #:tests? #false
                #:configure-flags '("-DARILES_VISITORS_DEFAULT_MODE=OFF"
                                    "-DARILES_CCACHE=OFF"
                                    "-DARILES_ENABLE_CORE=OFF"
                                    "-DARILES_VISITOR_pugixml=ON")
            )
        )
    )
)

ariles2_pugixml
