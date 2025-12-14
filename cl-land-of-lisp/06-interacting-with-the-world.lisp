;; Kappale 06 - Interacting with the World

(print "foo")

; "foo"  => "foo"

(progn (print "this")
       (print "is")
       (print "a")
       (print "test"))

; "this"
; "is"
; "a"
; "test"  => "test"

(progn (prin1 "this")
       (prin1 "is")
       (prin1 "a")
       (prin1 "test"))
; "this""is""a""test" => "test"

(defun say-hello ()
  (print "Please type your name:")
  (let ((name (read)))
    (print "Nice to meet you, ")
    (print name)))
 ; => SAY-HELLO

(say-hello)

; "Please type your name:"
; "Nice to meet you, "
; BOB  => BOB

(defun add-five ()
  (print "Please enter a number:")
  (let ((num (read)))
    (print "When I add five I get")
    (print (+ num 5))))
 ; => ADD-FIVE

(add-five)

; "Please enter a number:"
; "When I add five I get"
; 15  => 15 (4 bits, #xF, #o17, #b1111)

(add-five)

; "Please enter a number:"
; "When I add five I get"
; 9  => 9 (4 bits, #x9, #o11, #b1001)

(print '3)

; 3  => 3 (2 bits, #x3, #o3, #b11)

(print '3.4)

; 3.4  => 3.4

(print 'foo)

; FOO  => FOO

(print '"foo")

; "foo"  => "foo"

(print '#\a)

; #\a  => #\a

;; Huomioithan: #\newline #\tab, ja #\space merkit!

(princ '3)
; 3 => 3 (2 bits, #x3, #o3, #b11)

(princ '3.4)
; 3.4 => 3.4

(princ 'foo)
; FOO => FOO

(princ '"foo")
; foo => "foo"

(princ '#\a)
; a => #\a

(progn (princ "This sentence will be interrupted")
       (princ #\newline)
       (princ "by an annoying newline character."))
; This sentence will be interrupted
; by an annoying newline character. => "by an annoying newline character."

(defun say-hello ()
  (princ "Please type your name: ")
  (let ((name (read-line)))
    (princ "Nice to meet you, ")
    (princ name)))
 ; => SAY-HELLO
 ; => SAY-HELLO
 ; => SAY-HELLO

(say-hello)
; Please type your name: Nice to meet you, Mikko Mallikas => "Mikko Mallikas"
; Please type your name:Nice to meet you, Bob Marley => "Bob Marley"

'(+ 1 2)
 ; => (+ 1 2)

(+ 1 2)
 ; => 3 (2 bits, #x3, #o3, #b11)

(defparameter *foo* '(+ 1 2))
 ; => *FOO*

(eval *foo*)
 ; => 3 (2 bits, #x3, #o3, #b11)
