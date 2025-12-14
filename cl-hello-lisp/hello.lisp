;; ANSI Common LISP (X3J13)

; Basic math
(+ 1 4 2 3)
(- 2 3 (+ 4 (- 1 2)))
(* 3 2)
(/ 4 1)

; Basic string output
(format t "Hello World~%")

; Convert integer to string and output to stdout with newline at the end of the character stream
(write-line (write-to-string (+ 1 4 2 3 5)))

; Functions
(defun area-circle (rad)
    "Calculates area of a circle with given radius"
   (terpri)
   (format t "Radius: ~5f" rad)
   (format t "~%Area: ~10f" (* 3.141592 rad rad)))

(area-circle 10)

; Push a newline into the standard output stream
(terpri)

; Typical list of data items
(write (list 1 2 3) :escape t :pretty t)

; Macros
(defmacro set-to-10 (integer-variable)
    (setq integer-variable 10)
    (print integer-variable)
    (fresh-line))

(defvar my-variable nil)
(setq my-variable "List Processing")
(print my-variable)
(set-to-10 my-variable)

; Self-modifying code
(defun foo (x) (+ x 1))
(format t "~d~%" (foo 3))

(defun bar (x) (+ x 2))
(format t "~d~%" (bar 3))

(setf (symbol-function 'foo) #'bar)
(format t "~d~%" (foo 3))