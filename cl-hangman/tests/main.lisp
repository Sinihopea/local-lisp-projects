(defpackage cl-hangman/tests/main
  (:use :cl
        :cl-hangman
        :rove))
(in-package :cl-hangman/tests/main)

;; NOTE: To run this test file, execute `(asdf:test-system :cl-hangman)' in your Lisp.

(deftest test-target-1
  (testing "should (= 1 1) to be true"
    (ok (= 1 1))))
