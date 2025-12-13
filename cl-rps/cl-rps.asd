(defsystem "cl-rps"
  :version "0.0.1"
  :author ""
  :license ""
  :depends-on ()
  :components ((:module "src"
                :components
                ((:file "main"))))
  :description ""
  :in-order-to ((test-op (test-op "cl-rps/tests"))))

(defsystem "cl-rps/tests"
  :author ""
  :license ""
  :depends-on ("cl-rps"
               "rove")
  :components ((:module "tests"
                :components
                ((:file "main"))))
  :description "Test system for cl-rps"
  :perform (test-op (op c) (symbol-call :rove :run c)))
