(uiop:define-package cl-hangman
  (:use #:cl)
  (:export #:game))
(in-package #:cl-hangman)

;; blah blah blah.

(defun pick-sitcom (sitcoms)
  (nth (random (length sitcoms) (make-random-state t)) sitcoms))

; (pick-sitcom '(1 2 3 4 5 6))

(defun status (scrambled-sitcom lives guessed-letters)
  (format nil "Lives: ~A~%Letters: ~{~A~^, ~}~%Sitcom: ~A" lives guessed-letters scrambled-sitcom))

; (status "_____" 2 '(#\r ))

(defun scrambled-sitcom (sitcom guessed-letters)
  (flet ((letter-or-underscore (letter)
           (if (or (member letter guessed-letters) (equal letter #\Space))
               letter
               #\_)))
    (coerce (mapcar #'letter-or-underscore (coerce sitcom 'list)) 'string)))

; (scrambled-sitcom "cheers" '(#\e))
; (format nil "~{~A~^~}" (mapcar #'letter-or-underscore (coerce sitcom 'list)))))

(defun game-over-p (lives scrambled-sitcom)
  (if (or (<= lives 0) (eq nil (position #\_ scrambled-sitcom)))
       t
       nil))

;(let ((a 1) (b 2) (c "hi"))
;  (format nil "~A ~A ~A" a b c))
; (scrambled-sitcom "cheers" '(#\e #\c #\r #\h #\s))
; (coerce "this is a string" 'list)
; (game-over-p 10 "cheers")

(defun get-letter (guessed-letters)
  (format t "Pleae enter a letter: ")
  (let ((user-input (string-downcase (read-line))))
    (cond
      ; If the user just hits enter
      ((= 0 (length user-input))
       (get-letter guessed-letters))
      ; If the letter already exists in guessed-letters
      ((member (char user-input 0) guessed-letters)
       (get-letter guessed-letters))
      ; Otherwise take the first letter
      (t (char user-input 0)))))

; (member 4 '(1 2 3 4 5 6))

(defun game (&key (sitcom nil) (lives 10) (guessed-letters '()))
  ; If the game needs to start itself
  (unless sitcom
    (let ((sitcom (pick-sitcom '("cheers" "friends" "frasier" "the big bang theory" "the it crowd" "how i met your mother"))))
      (game :sitcom sitcom)))
  (let ((game-over (game-over-p lives (scrambled-sitcom sitcom guessed-letters))))
    ; If the game is over
    (when game-over
      (format t "~A~%" (status (scrambled-sitcom sitcom guessed-letters) lives guessed-letters))
      (return-from game "Game Over!"))
    ; If the game is not over
    (format t "~A~%" (status (scrambled-sitcom sitcom guessed-letters) lives guessed-letters))

    (let ((letter (get-letter guessed-letters)))
      (if (equal nil (position letter sitcom))
          (game :sitcom sitcom :lives (1- lives) :guessed-letters (cons letter guessed-letters))
          (game :sitcom sitcom :lives lives :guessed-letters (cons letter guessed-letters))))))

; (type-of :sitcom)
; (game)
