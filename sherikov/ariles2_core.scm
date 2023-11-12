(define-module (sherikov ariles2_core)
  #:use-module (guix licenses)
  #:use-module (guix packages)
  #:use-module (guix build-system cmake)
  #:use-module (guix git-download)
  #:use-module (gnu packages algebra)
  #:use-module (gnu packages boost))

(define-public ariles2_core
    (package
        (name "ariles2_core")
        (version "2.0.3")
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
                    (base32 "1kmhlmf4g0nxa52z9myywa0mcy3j47ynh6fgjiphw43szzcxr4m1")
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
                                    "-DARILES_CCACHE=OFF"
                                    "-DARILES_ENABLE_CORE=ON")
            )
        )
    )
)

ariles2_core
