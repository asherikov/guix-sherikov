(define-module (sherikov devel ariles2_yaml_cpp)
    #:use-module (guix packages)
    #:use-module (guix gexp)
    #:use-module (gnu packages serialization)
    #:use-module (sherikov helpers git)
    #:use-module (sherikov release ariles2_yaml_cpp)
)

(define-public ariles2_yaml_cpp-devel
    (package/inherit ariles2_yaml_cpp
        (name "ariles2_yaml_cpp-devel")
        (propagated-inputs (list ariles2_core-devel yaml-cpp))
        (version (sherikov-git-describe "./src/ariles"))
        (source
            (local-file "../../src/ariles"
                #:recursive? #t
            )
        )
    )
)

ariles2_yaml_cpp-devel
