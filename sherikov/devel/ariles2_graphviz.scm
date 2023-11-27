(define-module (sherikov devel ariles2_graphviz)
    #:use-module (guix packages)
    #:use-module (guix gexp)
    #:use-module (guix utils)
    #:use-module (sherikov helpers git)
    #:use-module (sherikov release ariles2_graphviz)
)

(define-public ariles2_graphviz-devel
    (package/inherit ariles2_graphviz
        (name "ariles2_graphviz-devel")
        (propagated-inputs (list ariles2_core-devel))
        (version (sherikov-git-describe "./src/ariles"))
        (source
            (local-file "../../src/ariles"
                #:recursive? #t
            )
        )
    )
)

ariles2_graphviz-devel
