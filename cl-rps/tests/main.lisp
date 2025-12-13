(defpackage cl-rps/tests/main
  (:use :cl
        :cl-rps
        :rove))
(in-package :cl-rps/tests/main)

;; NOTE: To run this test file, execute `(asdf:test-system :cl-rps)' in your Lisp.

(deftest test-target-1
  (testing "should (= 1 1) to be true"
    (ok (= 1 1))))
