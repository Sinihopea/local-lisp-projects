(defsystem "cl-myproject"
  :version "0.0.1"
  :author "Antti"
  :mailto "antti@localhost"
  :license ""
  :depends-on ("clack"
               "cl-annot")
  :components ((:module "src"
                :components
                ((:file "main"))))
  :description ""
  :in-order-to ((test-op (test-op "cl-myproject/tests"))))

(defsystem "cl-myproject/tests"
  :author "Antti"
  :license ""
  :depends-on ("cl-myproject"
               "rove")
  :components ((:module "tests"
                :components
                ((:file "main"))))
  :description "Test system for cl-myproject"
  :perform (test-op (op c) (symbol-call :rove :run c)))
