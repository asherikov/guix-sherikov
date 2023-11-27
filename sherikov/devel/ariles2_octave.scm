(define-module (sherikov devel ariles2_octave)
    #:use-module (guix packages)
    #:use-module (guix gexp)
    #:use-module (sherikov helpers git)
    #:use-module (sherikov release ariles2_octave)
)

(define-public ariles2_octave-devel
    (package/inherit ariles2_octave
        (name "ariles2_octave-devel")
        (propagated-inputs (list ariles2_core-devel))
        (version (sherikov-git-describe "./src/ariles"))
        (source
            (local-file "../../src/ariles"
                #:recursive? #t
            )
        )
    )
)

ariles2_octave-devel
