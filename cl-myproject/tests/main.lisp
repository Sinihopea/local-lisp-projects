(defpackage cl-myproject/tests/main
  (:use :cl
        :cl-myproject
        :rove))
(in-package :cl-myproject/tests/main)

;; NOTE: To run this test file, execute `(asdf:test-system :cl-myproject)' in your Lisp.

(deftest test-target-1
  (testing "should (= 1 1) to be true"
    (ok (= 1 1))))
