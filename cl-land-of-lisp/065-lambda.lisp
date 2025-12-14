; 6.5 Lambda: A Function so importan it deserves its own chapter

(defun half (n)
  (/ n 2))
 ; => HALF

#'half
 ; => #<FUNCTION HALF>

(lambda (n) (/ n 2))
 ; => #<FUNCTION (LAMBDA (N)) {22703ECB}>

(mapcar (lambda (n) (/ n 2)) '(2 4 6))
 ; => (1 2 3)
