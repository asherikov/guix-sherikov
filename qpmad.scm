(define-module (qpmad)
  #:use-module (guix licenses)
  #:use-module (guix packages)
  #:use-module (guix build-system cmake)
  #:use-module (guix git-download)
  #:use-module (gnu packages algebra))

(define-public qpmad
    (package
        (name "qpmad")
        (version "1.3.0")
        (source
            (origin
                (method git-fetch)
                (uri
                    (git-reference
                        (url "https://github.com/asherikov/qpmad")
                        (commit version)
                    )
                )
                (file-name (git-file-name name version))
                (sha256
                    (base32 "0dbxaypr9qw8sglv4v01d45k2pp3wgjj3ak0n14bjgxzc4li2hfn")
                )
            )
        )
        (build-system cmake-build-system)
        (synopsis
            "Eigen-based Goldfarb-Idnani quadratic programming solver"
        )
        (description synopsis)
        (home-page "https://www.sherikov.net/qpmad/")
        (license asl2.0)
        (propagated-inputs (list eigen))
        (arguments `(#:tests? #false))
    )
)

qpmad
