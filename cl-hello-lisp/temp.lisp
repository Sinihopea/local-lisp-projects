(eval '(defun (foo x) (* x x)))

; Homoiconicity
(defun makes(x) (list '+ x 2))

(write (makes(5)))