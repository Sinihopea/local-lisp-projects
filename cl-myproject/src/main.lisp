(uiop:define-package cl-myproject
  (:use #:cl))
(in-package #:cl-myproject)

;; blah blah blah.
(defvar *acceptor* (make-instance 'hunchentoot:easy-acceptor :port 4242))


; (hunchentoot:start *acceptor*)

; (hunchentoot:stop *acceptor*)
