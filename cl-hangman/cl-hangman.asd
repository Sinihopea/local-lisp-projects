(defsystem "cl-hangman"
  :version "0.1"
  :author "Antti"
  :license "GPL-2.0-or-later"
  :depends-on ()
  :components ((:module "src"
                :components
                ((:file "main"))))
  :description "Youtube tutorial game"
  :in-order-to ((test-op (test-op "cl-hangman/tests"))))

(defsystem "cl-hangman/tests"
  :author "Antti"
  :license "GPL-2.0-or-later"
  :depends-on ("cl-hangman"
               "rove")
  :components ((:module "tests"
                :components
                ((:file "main"))))
  :description "Test system for cl-hangman"
  :perform (test-op (op c) (symbol-call :rove :run c)))
