;; Kappale 04 - Making Decisions with Conditions

(if '()
    'i-am-true
    'i-am-false)
 ; => I-AM-FALSE

(if '(1)
    'i-am-true
    'i-am-false)
 ; => I-AM-TRUE

(defun my-length (list)
  (if list
      (1+ (my-length (cdr list)))
      0))
 ; => MY-LENGTH

(my-length '(list with four symbols))
 ; => 4 (3 bits, #x4, #o4, #b100)

(eq '() nil)
 ; => T

(eq '() ())
 ; => T

(eq '() 'nil)
 ; => T

;; Conditionals

(if (= (+ 1 2) 3)
    'yup
    'nope)
 ; => YUP

(if (= (+ 1 2) 4)
    'yup
    'nope)
 ; => NOPE

(if '(1)
    'the-list-has-stuff-in-it
    'the-list-is-empty)
 ; => THE-LIST-HAS-STUFF-IN-IT

(if '()
    'the-list-has-stuff-in-it
    'the-list-is-empty)
 ; => THE-LIST-IS-EMPTY

(if (oddp 5)
    'odd-number
    'even-number)
 ; => ODD-NUMBER

;; Whacky, emme todenna arvoa ehtolausekkeiden poluissa ennen kuin siihen polkuun osutaan.
;; Potentiaalinen paikka bugeille? Vaatii automaattitestausta, mikä on onneksi osa Common LISP:iä.
(if (oddp 5)
    'odd-number
    (/ 1 0))
 ; => ODD-NUMBER

(defvar *number-was-odd* nil)
 ; => *NUMBER-WAS-ODD*

(if (oddp 5)
    (progn (setf *number-was-odd* t)
           'odd-number)
    'even-number)
 ; => ODD-NUMBER

*number-was-odd*
 ; => T

(defvar *number-is-odd* nil)
 ; => *NUMBER-IS-ODD*

(when (oddp 5)
  (setf *number-is-odd* t)
  'odd-number)
 ; => ODD-NUMBER

*number-is-odd*
 ; => T

(unless (oddp 4)
  (setf *number-is-odd* nil)
  'even-number)
 ; => EVEN-NUMBER

*number-is-odd*
 ; => NIL

(defvar *arch-enemy* nil)
 ; => *ARCH-ENEMY*

(defun pudding-eater (person)
  (cond ((eq person 'henry)
           (setf *arch-enemy* 'stupid-lisp-alien)
           '(curse you lisp alien - you ate my pudding))
        ((eq person 'johnny)
           (setf *arch-enemy* 'useless-old-johnny)
           '(I hope you chocked on my pudding johnny))
        (t
           '(Why you eat my pudding stranger ?))))
 ; => PUDDING-EATER

(pudding-eater 'johnny)
 ; => (I HOPE YOU CHOCKED ON MY PUDDING JOHNNY)

*arch-enemy*
 ; => USELESS-OLD-JOHNNY

(pudding-eater 'george-clooney)
 ; => (WHY YOU EAT MY PUDDING STRANGER ?)

(defun pudding-eater (person)
  (case person
    ((henry)
      (setf *arch-enemy* 'stupid-lisp-alien)
      '(curse you lisp alien - you ate my pudding))
    ((johnny)
      (setf *arch-enemy* 'useless-old-johnny)
      '(I hope you chocked on my pudding johnny))
    (otherwise
      '(why you eat my pudding stranger ?))))
 ; => PUDDING-EATER

(pudding-eater 'henry)
 ; => (CURSE YOU LISP ALIEN - YOU ATE MY PUDDING)

*arch-enemy*
 ; => STUPID-LISP-ALIEN

(and (oddp 5) (oddp 7) (oddp 9))
 ; => T

(or (oddp 4) (oddp 7) (oddp 8))
 ; => T

(defparameter *is-it-even* nil)
 ; => *IS-IT-EVEN*

(or (oddp 4) (setf *is-it-even* t))
 ; => T

*is-it-even*
 ; => T

(defparameter *is-it-even* nil)
 ; => *IS-IT-EVEN*

(or (oddp 5) (setf *is-it-even* t))
 ; => T

*is-it-even*
 ; => NIL

; (if *file-modified*
;    (if (ask-user-about-saving)
;        (save-file)))

; (and *file-modified* (ask-user-about-saving) (save-file))

; (if (and *file-modified*
;         (ask-user-about-saving))
;    (save-file))

(if (member 1 '(3 4 1 5))
    'one-is-in-the-list
    'one-is-not-in-the-list)
 ; => ONE-IS-IN-THE-LIST

(member 1 '(3 4 1 5))
 ; => (1 5)

'(3 4 1 5)
 ; => (3 4 1 5)

(cons 3 (cons 4 (cons 1 (cons 5 nil))))
 ; => (3 4 1 5)

(if (member nil '(3 4 nil 5))
    'nil-is-in-the-list
    'nil-is-not-in-the-list)
 ; => NIL-IS-IN-THE-LIST

 (find-if #'oddp '(2 4 5 6))
 ; => 5 (3 bits, #x5, #o5, #b101)

(if (find-if #'oddp '(2 4 5 6))
    'there-is-an-odd-number
    'there-is-no-odd-number)
 ; => THERE-IS-AN-ODD-NUMBER

(find-if #'null '(2 4 nil 6))
 ; => NIL

(defparameter *fruit* 'apple)
 ; => *FRUIT*

(cond ((eq *fruit* 'apple) 'its-an-apple)
      ((eq *fruit* 'orange) 'its-an-orange))
 ; => ITS-AN-APPLE

(equal 'apple 'apple)
 ; => T

(equal (list 1 2 3) (list 1 2 3))
 ; => T

; Kirjassa on bugi tässä kohtaa koodia,
; nil pitää lisätä listan loppuun consille viimeiseen jäseneen kertomaan listan päättymisestä
(equal '(1 2 3) (cons 1 (cons 2 (cons 3 nil))))
 ; => T

(equal 5 5)
 ; => T

(equal 2.5 2.5)
 ; => T

(equal "foo" "foo")
 ; => T

(equal "foo" "bar")
 ; => NIL

(equal #\a #\a)
 ; => T

;;-------------------;;

(eql 'foo 'foo)
 ; => T

(eql 3.4 3.4)
 ; => T

(eql #\a #\a)
 ; => T

;;-------------------;;

(equalp "Bob Smith" "bob smith")
 ; => T

(equal "bob" "Bob")
 ; => NIL

(equalp 0 0.0)
 ; => T

(equal 0 0.0)
 ; => NIL

(equal 1 (/ 2 2))
 ; => NIL
 ; => T
 ; => T
 ; => NIL
 ; => NIL
 ; => NIL

(/ 2 1)
 ; => 2 (2 bits, #x2, #o2, #b10)
