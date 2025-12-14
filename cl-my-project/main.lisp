(in-package #:org.my-project)

(defclass main (trial:main)
  ())

(defun launch (&rest args)
  (apply #'trial:launch 'main args))
