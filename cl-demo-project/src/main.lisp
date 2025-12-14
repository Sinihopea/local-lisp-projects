(defpackage demo-project
  (:use :cl))
(in-package :demo-project)

;; blah blah blah.
(format t "Hello, World~%")

(defun hello-world (name)
  (format t "Hello, ~A!~%" name))

(hello-world "Antti")

;; (ql:quickload :clsql)
