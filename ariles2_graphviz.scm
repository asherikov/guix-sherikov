(define-module (ariles2_graphviz)
  #:use-module (guix packages)
  #:use-module (ariles2_core))

(define-public ariles2_graphviz
    (package
        (inherit ariles2_core)
        (name "ariles2_graphviz")
        (propagated-inputs (list ariles2_core))
        (arguments
            `(  #:tests? #false
                #:configure-flags '("-DARILES_VISITORS_DEFAULT_MODE=OFF"
                                    "-DARILES_CCACHE=OFF"
                                    "-DARILES_ENABLE_CORE=OFF"
                                    "-DARILES_VISITOR_graphviz=ON")
            )
        )
    )
)

ariles2_graphviz
