;; main.lisp

(write-line "Hello")

(+ 3 5)

;; (3 + 5)
;; (+ 3 (5 6))

(+ 3 (* 5 6))

'(morning noon night)

;; ('morning 'noon 'night)

(list 'morning 'noon 'night)

(car nil)

;; (+ 3 foo)
;; (+ 3 'foo)

; (defun myfun (alpha beta) (quote ((alpha) beta)))
; (myfun 'alpha 'beta)

(defun test () (* 85 97))

(test)
 ; => 8245 (14 bits, #x2035)

(zerop 5)
 ; => NIL

; (+ 1 nil)

(quote foo)
 ; => FOO

(quote (hello world))

'(hello world)

''foo
 ; => 'FOO

(list 'quote 'foo)
 ; => 'FOO

(first ''foo)
 ; => QUOTE

(rest ''foo)
 ; => (FOO)

(length ''foo)
 ; => 2 (2 bits, #x2, #o2, #b10)

(equal 3 5)
 ; => NIL

; (lambda (x) (+ 3 x))

; (lambda (x y) (+ (* 3 x) (* y y)))

; (defun parent (n) (child (+ n 2)))

; (defun child (p) (list n p))
