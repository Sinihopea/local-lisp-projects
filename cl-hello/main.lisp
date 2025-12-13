;; This is a test

(defpackage :hello
  (:use :cl))

(in-package :hello)

(format t "Hello, World~%")
; Hello, World
;  => NIL
