(defpackage cl-tic-tac-toe/tests/main
  (:use :cl
        :cl-tic-tac-toe
        :rove))
(in-package :cl-tic-tac-toe/tests/main)

;; NOTE: To run this test file, execute `(asdf:test-system :cl-tic-tac-toe)' in your Lisp.

(deftest test-target-1
  (testing "should (= 1 1) to be true"
    (ok (= 1 1))))
