;; Kappale 05 - Building a Text Game Engine

(defparameter *nodes* '(
                        (living-room (you are in the living-room.
                                      a wizard is snoring loudly on the couch.))
                        (garden (you are in the garden.
                                 there is a well in front of you.))
                        (attic (you are in the attic.
                                there is a giant welding torch in the corner.))))
 ; => *NODES*

(assoc 'garden *nodes*)
 ; => (GARDEN (YOU ARE IN THE GARDEN. THERE IS A WELL IN FRONT OF YOU.))

(defun describe-location (location nodes)
  (cadr (assoc location nodes)))
 ; => DESCRIBE-LOCATION

(describe-location 'living-room *nodes*)
 ; => (YOU ARE IN THE LIVING-ROOM. A WIZARD IS SNORING LOUDLY ON THE COUCH.)

(defparameter *edges* '(
                        (living-room (garden west door)
                                     (attic upstairs ladder))
                        (garden (living-room east door))
                        (attic (living-room downstairs ladder))))
 ; => *EDGES*

(defun describe-path (edge)
  `(there is a ,(caddr edge) going ,(cadr edge) from here.))
 ; => DESCRIBE-PATH

(describe-path '(garden west door))
 ; => (THERE IS A DOOR GOING WEST FROM HERE.)

(defun describe-paths (location edges)
  (apply #'append (mapcar #'describe-path (cdr (assoc location edges)))))
 ; => DESCRIBE-PATHS

(describe-paths 'living-room *edges*)
 ; => (THERE IS A DOOR GOING WEST FROM HERE. THERE IS A LADDER GOING UPSTAIRS FROM
 ; HERE.)

(cdr (assoc 'living-room *edges*))
 ; => ((GARDEN WEST DOOR) (ATTIC UPSTAIRS LADDER))

(mapcar #'describe-path '((garden west door) (attic upstairs ladder)))
 ; => ((THERE IS A DOOR GOING WEST FROM HERE.)
 ; (THERE IS A LADDER GOING UPSTAIRS FROM HERE.))

(mapcar #'sqrt '(1 2 3 4 5))
 ; => (1.0 1.4142135 1.7320508 2.0 2.236068)

(mapcar #'car '((foo bar) (baz qux)))
 ; => (FOO BAZ)

(mapcar (function car) '((foo bar) (baz qux)))
 ; => (FOO BAZ)

(documentation 'function 'function)
;  => "FUNCTION name

; Return the lexically apparent definition of the function NAME. NAME may also
; be a lambda expression."

(let ((car "Honda Civic"))
  (mapcar #'car '((foo bar) (baz qux))))
 ; => (FOO BAZ)

(defun describe-paths (location edges)
  (apply #'append (mapcar #'describe-path (cdr (assoc location edges)))))
 ; => DESCRIBE-PATHS

(append '(mary had) '(a) '(little lamb))
 ; => (MARY HAD A LITTLE LAMB)

(apply #'append '((mary had) (a) (little lamb)))
 ; => (MARY HAD A LITTLE LAMB)

(apply #'append '((THERE IS A DOOR GOING WEST FROM HERE.)
                  (THERE IS A LADDER GOING UPSTAIRS FROM HERE.)))
 ; => (THERE IS A DOOR GOING WEST FROM HERE. THERE IS A LADDER GOING UPSTAIRS FROM
 ; HERE.)

(defun describe-paths (location edges)
  (apply #'append (mapcar #'describe-path (cdr (assoc location edges)))))
 ; => DESCRIBE-PATHS

(defparameter *objects* '(whiskey bucket frog chain))
 ; => *OBJECTS*

(defparameter *object-locations* '((whiskey living-room)
                                   (bucket living-room)
                                   (chain garden)
                                   (frog garden)))
 ; => *OBJECT-LOCATIONS*

(defun objects-at (loc objs obj-locs)
  (labels ((at-loc-p (obj)
           (eq (cadr (assoc obj obj-locs)) loc)))
  (remove-if-not #'at-loc-p objs)))
 ; => OBJECTS-AT

(objects-at 'living-room *objects* *object-locations*)
 ; => (WHISKEY BUCKET)

(defun describe-objects (loc objs obj-loc)
  (labels ((describe-obj (obj)
             `(you see a ,obj on the floor.)))
    (apply #'append (mapcar #'describe-obj (objects-at loc objs obj-loc)))))
 ; => DESCRIBE-OBJECTS

(describe-objects 'living-room *objects* *object-locations*)
 ; => (YOU SEE A WHISKEY ON THE FLOOR. YOU SEE A BUCKET ON THE FLOOR.)

(defparameter *location* 'living-room)
 ; => *LOCATION*

(defun look ()
  (append (describe-location *location* *nodes*)
          (describe-paths *location* *edges*)
          (describe-objects *location* *objects* *object-locations*)))
 ; => LOOK
 ; => LOOK

(look)
 ; => (YOU ARE IN THE LIVING-ROOM. A WIZARD IS SNORING LOUDLY ON THE COUCH. THERE IS
 ; A DOOR GOING WEST FROM HERE. THERE IS A LADDER GOING UPSTAIRS FROM HERE. YOU
 ; SEE A WHISKEY ON THE FLOOR. YOU SEE A BUCKET ON THE FLOOR.)

(defun walk (direction)
  (let ((next (find direction
                    (cdr (assoc *location* *edges*))
                    :key #'cadr)))
    (if next
        (progn (setf *location* (car next))
               (look))
        '(you cannot go that way.))))
 ; => WALK

(documentation 'find 'function)
 ; => NIL

(find 'y '((5 x) (3 y) (7 z)) :key #'cadr)
 ; => (3 Y)

(walk 'west)
 ; => (YOU ARE IN THE GARDEN. THERE IS A WELL IN FRONT OF YOU. THERE IS A DOOR GOING
 ; EAST FROM HERE. YOU SEE A FROG ON THE FLOOR. YOU SEE A CHAIN ON THE FLOOR.)

(defun pickup (object)
  (cond ((member object
                 (objects-at *location* *objects* *object-locations*))
        (push (list object 'body) *object-locations*)
        `(you are now carrying the ,object))
  (t '(you cannot get that.))))
 ; => PICKUP

(defparameter *foo* '(1 2 3))
 ; => *FOO*

(push 7 *foo*)
 ; => (7 1 2 3)

*foo*
 ; => (7 1 2 3)

(walk 'east)
 ; => (YOU ARE IN THE LIVING-ROOM. A WIZARD IS SNORING LOUDLY ON THE COUCH. THERE IS
 ; A DOOR GOING WEST FROM HERE. THERE IS A LADDER GOING UPSTAIRS FROM HERE. YOU
 ; SEE A WHISKEY ON THE FLOOR. YOU SEE A BUCKET ON THE FLOOR.)

(pickup 'whiskey)
 ; => (YOU ARE NOW CARRYING THE WHISKEY)

(defun inventory ()
  (cons 'items- (objects-at 'body *objects* *object-locations*)))
 ; => INVENTORY

(inventory)
 ; => (ITEMS- WHISKEY)

; Kappaleen 06, sivun 92, asiaa modattavasta REPL-ympäristöstä...

; (defun game-repl ()
;  (loop (print (eval (read)))))
 ; => GAME-REPL

; (game-repl)

; (look)

(defun game-repl()
  (let ((cmd (game-read)))
    (unless (eq (car cmd) 'quit)
      (game-print (game-eval cmd))
      (game-repl))))
 ; => GAME-REPL

(defun game-read()
  (let ((cmd (read-from-string
              (concatenate 'string "(" (read-line) ")" ))))
    (flet ((quote-it (x)
             (list 'quote x)))
      (cons (car cmd) (mapcar #'quote-it (cdr cmd))))))
 ; => GAME-READ

(game-read)
 ; => (WALK 'EAST)

(defparameter *allowed-commands* '(look walk pickup inventory))
 ; => *ALLOWED-COMMANDS*

(defun game-eval(sexp)
  (if (member (car sexp) *allowed-commands*)
      (eval sexp)
      '(I do not know that command.)))
 ; => GAME-EVAL

(game-print '(THIS IS A SENTENCE. WHAT ABOUT THIS? PROBABLY.))

(defun tweak-text (lst caps lit)
  (when lst
    (let ((item (car lst))
          (rest (cdr lst)))
      (cond ((eq item #\space) (cons item (tweak-text rest caps lit)))
            ((member item '(#\! #\? #\.)) (cons item (tweak-text rest t lit)))
            ((eq item #\") (tweak-text rest caps (not lit)))
             (lit (cons item (tweak-text rest nil lit)))
             ((or caps lit) (cons (char-upcase item) (tweak-text rest nil lit)))
             (t (cons (char-downcase item) (tweak-text rest nil nil)))))))
 ; => TWEAK-TEXT

(defun game-print (lst)
  (princ (coerce (tweak-text (coerce (string-trim "() "
                                                  (prin1-to-string lst))
                                     'list)
                             t
                             nil)
                 'string))
  (fresh-line))
 ; => GAME-PRINT

(game-print '(not only does this sentence have a "comma," it also mentions the "iPad."))
; Not only does this sentence have a comma, it also mentions the iPad.
;  => T

; (game-repl)
; You are in the living-room. A wizard is snoring loudly on the couch. There is
;  a door going west from here. There is a ladder going upstairs from here. You
;  see a bucket on the floor.
; You are in the garden. There is a well in front of you. There is a door going
;  east from here. You see a frog on the floor. You see a chain on the floor.
; You are now carrying the chain
; I do not know that command.
; I do not know that command.
; You are in the living-room. A wizard is snoring loudly on the couch. There is
;  a door going west from here. There is a ladder going upstairs from here. You
;  see a bucket on the floor.
;  => NIL
