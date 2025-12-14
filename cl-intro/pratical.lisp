;; practical.lisp

#xa
 ; => 10 (4 bits, #xA, #o12, #b1010)

20/2
 ; => 10 (4 bits, #xA, #o12, #b1010)

10
 ; => 10 (4 bits, #xA, #o12, #b1010)

(cons 1 nil)
 ; => (1)

(cons 1 (cons 2 nil))

 ; => (1 2)

(cons 1 (cons 2 (cons 3 nil)))

 ; => (1 2 3)

(append (list 1 2) (list 3 4))

 ; => (1 2 3 4)

(defparameter *list-1* (list 1 2))

 ; => *LIST-1*

(defparameter *list-2* (list 3 4))


 ; => *LIST-2*

(defparameter *list-3* (append *list-1* *list-2*))


 ; => *LIST-3*

*list-3*

 ; => (1 2 3 4)

(setf (first *list-2*) 0)

 ; => 0 (0 bits, #x0, #o0, #b0)

*list-2*
 ; => (0 4)

*list-3*

 ; => (1 2 0 4)

; (setf *list* (reverse *list*))

(mapcar #'(lambda (x) (* 2 x))
        (list 1 2 3))

 ; => (2 4 6)

(mapcar #'+ (list 1 2 3)
        (list 10 20 30))

 ; => (11 22 33)
