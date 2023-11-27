(define-module (sherikov devel ariles2_rapidjson)
    #:use-module (guix packages)
    #:use-module (guix gexp)
    #:use-module (gnu packages web)
    #:use-module (sherikov helpers git)
    #:use-module (sherikov release ariles2_rapidjson)
)
  
(define-public ariles2_rapidjson-devel
    (package/inherit ariles2_rapidjson
        (name "ariles2_rapidjson-devel")
        (propagated-inputs (list ariles2_core-devel rapidjson))
        (version (sherikov-git-describe "./src/ariles"))
        (source
            (local-file "../../src/ariles"
                #:recursive? #t
            )
        )
    )
)

ariles2_rapidjson-devel
