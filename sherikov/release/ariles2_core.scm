(define-module (sherikov release ariles2_core)
    #:use-module (guix licenses)
    #:use-module (guix packages)
    #:use-module (guix build-system cmake)
    #:use-module (guix git-download)
    #:use-module (guix gexp)
    #:use-module (gnu packages algebra)
    #:use-module (gnu packages boost)
)

(define-public ariles2_core
    (package
        (name "ariles2_core")
        (version "2.1.0")
        (source
            (origin
                (method git-fetch)
                (uri
                    (git-reference
                        (url "https://github.com/asherikov/ariles")
                        (commit version)
                    )
                )
                (file-name (git-file-name name version))
                (sha256
                    (base32 "0c9y9f7hizfy7vrh3l4vga7g56cppxjxyliqyy8gffrwnpxn1bas")
                )
            )
        )
        (build-system cmake-build-system)
        (synopsis
            "C++ reflection library with focus on serialization/configuration"
        )
        (description synopsis)
        (home-page "https://www.sherikov.net/ariles/2/")
        (license asl2.0)
        (propagated-inputs (list eigen boost))
        (arguments
            `(  #:tests? #false
                #:configure-flags '("-DARILES_VISITORS_DEFAULT_MODE=OFF"
                                    "-DARILES_CPP_STANDARD=14"
                                    "-DARILES_CCACHE=OFF"
                                    "-DARILES_BUILD_REGRESSION_TESTS=OFF"
                                    "-DARILES_ENABLE_CORE=ON")
            )
        )
    )
)

ariles2_core
