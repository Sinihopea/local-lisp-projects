(defsystem "cl-tic-tac-toe"
  :version "0.0.1"
  :author ""
  :license ""
  :depends-on ()
  :components ((:module "src"
                :components
                ((:file "main"))))
  :description ""
  :in-order-to ((test-op (test-op "cl-tic-tac-toe/tests"))))

(defsystem "cl-tic-tac-toe/tests"
  :author ""
  :license ""
  :depends-on ("cl-tic-tac-toe"
               "rove")
  :components ((:module "tests"
                :components
                ((:file "main"))))
  :description "Test system for cl-tic-tac-toe"
  :perform (test-op (op c) (symbol-call :rove :run c)))
