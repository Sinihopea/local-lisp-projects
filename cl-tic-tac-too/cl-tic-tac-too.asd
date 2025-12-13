(defsystem "cl-tic-tac-too"
  :version "0.0.1"
  :author ""
  :license ""
  :depends-on ()
  :components ((:module "src"
                :components
                ((:file "main"))))
  :description ""
  :in-order-to ((test-op (test-op "cl-tic-tac-too/tests"))))

(defsystem "cl-tic-tac-too/tests"
  :author ""
  :license ""
  :depends-on ("cl-tic-tac-too"
               "rove")
  :components ((:module "tests"
                :components
                ((:file "main"))))
  :description "Test system for cl-tic-tac-too"
  :perform (test-op (op c) (symbol-call :rove :run c)))
