;; 07 - Going Beyond Basic Lists

(cons 1 (cons 2 (cons 3 nil)))
 ; => (1 2 3)

(cons 1 (cons 2 3))
 ; => (1 2 . 3)

'(1 . (2 . (3 . nil)))
 ; => (1 2 3)

(cons 2 3)
 ; => (2 . 3)

(setf *print-circle* t)
 ; => T

(defparameter foo '(1 2 3))
 ; => FOO

(setf (cdddr foo) foo)
 ; => (1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3
 ; 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3
 ; 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3
 ; 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3
 ; 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3
 ; 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3
 ; 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3
 ; 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3
 ; 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3
 ; 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3
 ; 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3
 ; 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3
 ; 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3
 ; 1 2 3 1 2 ...)

(defparameter *drink-order* '((bill . double-espresso)
                              (lisa . small-drip-coffee)
                              (john . medium-latte)))
 ; => *DRINK-ORDER*

(assoc 'lisa *drink-order*)
 ; => (LISA . SMALL-DRIP-COFFEE)

(push '(lisa . large-mocha-with-whipped-cream) *drink-order*)
 ; => ((LISA . LARGE-MOCHA-WITH-WHIPPED-CREAM) (BILL . DOUBLE-ESPRESSO)
 ; (LISA . SMALL-DRIP-COFFEE) (JOHN . MEDIUM-LATTE))

(assoc 'lisa *drink-order*)
 ; => (LISA . LARGE-MOCHA-WITH-WHIPPED-CREAM)

(defparameter *house* '((walls (mortar (cement)
                                (water)
                                (sand))
                         (bricks))
                        (windows (glass)
                         (frame)
                         (curtains))
                        (roof (shingles)
                         (chimney))))
 ; => *HOUSE*

;; Graphs

(defparameter *wizzard-nodes* '((living-room (you are in the living-room. a wizzard is noring loudly on the couch.))
                                (garden (you are in a beautiful garden. there is a well in front of you.))
                                (attic (you are in the attic. there is a giant welding torch in the corner.))))
 ; => *WIZZARD-NODES*

(defparameter *wizzard-edges* '((living-room (garden west door)
                                 (attic upstairs ladder))
                                (garden (living-room east door))
                                (attic (living-room downstairs ladder))))
 ; => *WIZZARD-EDGES*

(defun dot-name (exp)
  (substitute-if #\_ (complement #'alphanumericp) (prin1-to-string exp)))
 ; => DOT-NAME

(dot-name 'living-room)
 ; => "LIVING_ROOM"

(dot-name 'foo!)
 ; => "FOO_"

(dot-name '24)
 ; => "24"

(substitute-if #\e #'digit-char-p "I'm a l33t hack3r!")
 ; => "I'm a leet hacker!"

(substitute-if 0 #'oddp '(1 2 3 4 5 6 7 8))
 ; => (0 2 0 4 0 6 0 8)

(complement #'alphanumericp)
 ; => #<FUNCTION (LAMBDA (&REST SB-IMPL::ARGUMENTS) :IN COMPLEMENT) {10048E04EB}>

(defparameter *max-label-lenght* 30)
 ; => *MAX-LABEL-LENGHT*

(defun dot-label (exp)
  (if exp
      (let ((s (write-to-string exp :pretty nil)))
        (if (> (length s) *max-label-lenght*)
            (concatenate 'string (subseq s 0 (- *max-label-lenght* 3)) "...")
            s))
      ""))
 ; => DOT-LABEL

(defun nodes->dot (nodes)
  (mapc (lambda (node)
          (fresh-line)
          (princ (dot-name (car node)))
          (princ "[label=\"")
          (princ (dot-label node))
          (princ "\"];"))
        nodes))
 ; => NODES->DOT

(nodes->dot *wizzard-nodes*)
; LIVING_ROOM[label="(LIVING-ROOM (YOU ARE IN TH..."];
; GARDEN[label="(GARDEN (YOU ARE IN A BEAUT..."];
; ATTIC[label="(ATTIC (YOU ARE IN THE ATTI..."]; => ((LIVING-ROOM
;   (YOU ARE IN THE LIVING-ROOM. A WIZZARD IS NORING LOUDLY ON THE COUCH.))
;  (GARDEN (YOU ARE IN A BEAUTIFUL GARDEN. THERE IS A WELL IN FRONT OF YOU.))
;  (ATTIC (YOU ARE IN THE ATTIC. THERE IS A GIANT WELDING TORCH IN THE CORNER.)))

(defun edges->dot (edges)
  (mapc (lambda (node)
          (mapc (lambda (edge)
                  (fresh-line)
                  (princ (dot-name (car node)))
                  (princ "->")
                  (princ (dot-name (car edge)))
                  (princ "[label=\"")
                  (princ (dot-label (cdr edge)))
                  (princ "\"];"))
                (cdr node)))
        edges))
 ; => EDGES->DOT

(edges->dot *wizzard-edges*)
; LIVING_ROOM->GARDEN[label="(WEST DOOR)"];
; LIVING_ROOM->ATTIC[label="(UPSTAIRS LADDER)"];
; GARDEN->LIVING_ROOM[label="(EAST DOOR)"];
; ATTIC->LIVING_ROOM[label="(DOWNSTAIRS LADDER)"]; => ((LIVING-ROOM (GARDEN WEST DOOR) (ATTIC UPSTAIRS LADDER))
;  (GARDEN (LIVING-ROOM EAST DOOR)) (ATTIC (LIVING-ROOM DOWNSTAIRS LADDER)))

(defun graph->dot (nodes edges)
  (princ "digraph{")
  (nodes->dot nodes)
  (edges->dot edges)
  (princ "}"))
 ; => GRAPH->DOT

(graph->dot *wizzard-nodes* *wizzard-edges*)
; digraph{
; LIVING_ROOM[label="(LIVING-ROOM (YOU ARE IN TH..."];
; GARDEN[label="(GARDEN (YOU ARE IN A BEAUT..."];
; ATTIC[label="(ATTIC (YOU ARE IN THE ATTI..."];
; LIVING_ROOM->GARDEN[label="(WEST DOOR)"];
; LIVING_ROOM->ATTIC[label="(UPSTAIRS LADDER)"];
; GARDEN->LIVING_ROOM[label="(EAST DOOR)"];
; ATTIC->LIVING_ROOM[label="(DOWNSTAIRS LADDER)"];} => "}"

(defun dot->png (fname thunk)
  (with-open-file (*standard-output*
                   fname
                   :direction :output
                   :if-exists :supersede)
    (funcall thunk))
  ;(ext:shell (concatenate 'string "dot -Tpng -O " fname)))
   (sb-ext:run-program "C:\\Program Files\\Graphviz\\bin\\dot.exe" (concatenate 'string "-Tpng -O " fname) :search t :wait t))
 ; => DOT->PNG

; (defun test-writing-to-file (my-stream)
;  (with-open-file (my-stream
;                   "testfile.txt"
;                   :direction :output
;                   :if-exists :supersede)
;    (princ "Hello File!" my-stream)))

(let ((cigar 5))
  cigar)

(defun graph->png (fname nodes edges)
  (dot->png fname
            (lambda ()
              (graph->dot nodes edges))))
 ; => GRAPH->PNG

(graph->png "wizardmore.dot" *wizzard-nodes* *wizzard-edges*)
 ; => #<SB-IMPL::PROCESS :EXITED 0>
 ; => #<SB-IMPL::PROCESS :EXITED 0>

(mapcar #'print '(a b c))

; A
; B
; C  => (A B C)

(maplist #'print '(a b c))

; (A B C)
; (B C)
; (C)  => ((A B C) (B C) (C))
