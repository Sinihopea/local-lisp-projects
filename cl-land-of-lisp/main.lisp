;; Land of LISP 01

(defparameter *small* 1)
 ; => *SMALL*

(defparameter *big* 100)
 ; => *BIG*

;; defparameter on globaali muuttujan julistaja, jonka arvo voidaan yli-ajaa.
(defparameter *foo* 5)
(defparameter *foo* 6)

;; defvar on globaali muuttujan julistaja, jonka arvoa ei voida yli-ajaa.
(defvar *foo* 5)
(defvar *foo* 6)

(defun guess-my-number ()
  (ash (+ *small* *big*) -1))
 ; => GUESS-MY-NUMBER

(ash 11 1)
 ; => 22 (5 bits, #x16, #o26, #b10110)
(ash 11 -1)
 ; => 5 (3 bits, #x5, #o5, #b101)

(guess-my-number)

(defun return-five ()
  (+ 2 3))
 ; => RETURN-FIVE

(return-five)
 ; => 5 (3 bits, #x5, #o5, #b101)

(defun smaller ()
  (setf *big* (1- (guess-my-number)))
  (guess-my-number))
 ; => SMALLER

(defun bigger ()
  (setf *small* (1+ (guess-my-number)))
  (guess-my-number))
 ; => BIGGER

(bigger)
 ; => 59 (6 bits, #x3B, #o73, #b111011)

(smaller)
 ; => 57 (6 bits, #x39, #o71, #b111001)

(smaller)
 ; => 56 (6 bits, #x38, #o70, #b111000)

(defun start-over ()
  (defparameter *small* 1)
  (defparameter *big* 100)
  (guess-my-number))

(let ((a 5)
      (b 6))
  (+ a b))
 ; => 11 (4 bits, #xB, #o13, #b1011)

(flet ((f (n)
         (+ n 10)))
  (f 5))
 ; => 15 (4 bits, #xF, #o17, #b1111)

(flet ((f (n)
         (+ n 10))
       (g (n)
         (- n 3)))
  (g (f 5)))
 ; => 12 (4 bits, #xC, #o14, #b1100)
 ; => -8 (3 bits)

(labels ((a (n)
           (+ n 5))
         (b (n)
           (+ (a n) 6)))
  (b 10))
 ; => 21 (5 bits, #x15, #o25, #b10101)

(defun square (n)
  (* n n))
 ; => SQUARE

(square 1.6)
 ; => 2.5600002

(square (/ 16 9))
 ; => 256/81 (3.1604939)

(square (/ 16 10))
 ; => 64/25 (2.56)

(eq 'fooo 'FoOoo)
 ; => NIL

(+ 1 1.0)
 ; => 2.0

(expt 53 53)
 ; => 24356848165022712132477606520104725518533453128685640844505130879576720609150223301256150373 (304 bits)

(/ 4 6)
 ; => 2/3 (0.6666667, 200/3%)

(/ 4.0 6)
 ; => 0.6666667 (66.66667%)

(princ "Tutti Frutti")
; Tutti Frutti => "Tutti Frutti"

(princ "He yelled \"Stop that thief!\" from the busy street.")
; He yelled "Stop that thief!" from the busy street. => "He yelled \"Stop that thief!\" from the busy street."

(expt 2 3)
 ; => 8 (4 bits, #x8, #o10, #b1000)

(expt 2 (+ 3 4))
 ; => 128 (8 bits, #x80, #o200, #b10000000)

'(expt 2 3)
 ; => (EXPT 2 3)

(expt 2 3)
 ; => 8 (4 bits, #x8, #o10, #b1000)

(cons 'chicken 'cat)
 ; => (CHICKEN . CAT)
 ; => (CHICKEN)

(cons 'chiken 'nil)
 ; => (CHIKEN)

(cons 'chicken ())
 ; => (CHICKEN)

(cons 'pork '(beef chicken))
 ; => (PORK BEEF CHICKEN)

(cons 'beef (cons 'chicken ()))
 ; => (BEEF CHICKEN)

(cons 'pork (cons 'beef (cons 'chicken ())))
 ; => (PORK BEEF CHICKEN)

(car '(pork beef chicken))
 ; => PORK

(cdr '(pork beef chicken))
 ; => (BEEF CHICKEN)

(cdr '(pork beef chicken))
 ; => (BEEF CHICKEN)

(car '(beef chicken))
 ; => BEEF

(car (cdr '(pork beef chicken)))
 ; => BEEF

(cadr '(pork beef chicken))
 ; => BEEF

(list 'pork 'beef 'chicken)
 ; => (PORK BEEF CHICKEN)

'(car (duck bat) ant)
 ; => (CAR (DUCK BAT) ANT)
