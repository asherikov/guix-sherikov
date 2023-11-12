(define-module (sherikov cpput)
  #:use-module (guix licenses)
  #:use-module (guix packages)
  #:use-module (guix build-system cmake)
  #:use-module (guix git-download))

(define-public cpput
    (package
        (name "cpput")
        (version "1.2.0")
        (source
            (origin
                (method git-fetch)
                (uri
                    (git-reference
                        (url "https://github.com/asherikov/cpput")
                        (commit version)
                    )
                )
                (file-name (git-file-name name version))
                (sha256
                    (base32 "1sv125hmiy949ab990wz31vccp7rry8yh98h46ikwzfiwx9vwh8p")
                )
            )
        )
        (build-system cmake-build-system)
        (synopsis
            "C++ utilities from various sources"
        )
        (description synopsis)
        (home-page "https://github.com/asherikov/cpput")
        (license asl2.0)
        (arguments 
            `(  #:tests? #false
                #:configure-flags '("-DCPPUT_BUILD_TESTS=OFF")
            )
        )
    )
)

cpput
