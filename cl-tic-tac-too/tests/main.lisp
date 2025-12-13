(defpackage cl-tic-tac-too/tests/main
  (:use :cl
        :cl-tic-tac-too
        :rove))
(in-package :cl-tic-tac-too/tests/main)

;; NOTE: To run this test file, execute `(asdf:test-system :cl-tic-tac-too)' in your Lisp.

(deftest test-target-1
  (testing "should (= 1 1) to be true"
    (ok (= 1 1))))
