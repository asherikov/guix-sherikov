(define-module (sherikov devel ariles2_pugixml)
    #:use-module (guix packages)
    #:use-module (guix gexp)
    #:use-module (gnu packages xml)
    #:use-module (sherikov helpers git)
    #:use-module (sherikov release ariles2_pugixml)
)

(define-public ariles2_pugixml-devel
    (package/inherit ariles2_pugixml
        (name "ariles2_pugixml-devel")
        (propagated-inputs (list ariles2_core-devel pugixml))
        (version (sherikov-git-describe "./src/ariles"))
        (source
            (local-file "../../src/ariles"
                #:recursive? #t
            )
        )
    )
)

ariles2_pugixml-devel
