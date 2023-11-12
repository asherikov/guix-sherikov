(define-module (sherikov thread_supervisor)
  #:use-module (guix licenses)
  #:use-module (guix packages)
  #:use-module (guix build-system cmake)
  #:use-module (guix git-download))

(define-public thread_supervisor
    (package
        (name "thread_supervisor")
        (version "1.0.0")
        (source
            (origin
                (method git-fetch)
                (uri
                    (git-reference
                        (url "https://github.com/asherikov/thread_supervisor")
                        (commit version)
                    )
                )
                (file-name (git-file-name name version))
                (sha256
                    (base32 "1z05wnd5m6ibjnz4k7irfwg7768frig98yw49i10dsm1lqjcz2ya")
                )
            )
        )
        (build-system cmake-build-system)
        (synopsis 
            "C++11 thread supervisor which conditionally restarts failed or finished threads"
        )
        (description synopsis)
        (home-page "https://github.com/asherikov/thread_supervisor")
        (license asl2.0)
        (arguments `(#:tests? #false))
    )
)

thread_supervisor
