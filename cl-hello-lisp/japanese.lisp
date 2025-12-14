;; Japanese symbols

(defun 月給 (&key アキ マイコ ユリ コナタ)
    (write (list アキ マイコ ユリ コナタ)))

(月給 :マイコ "１００円" :アキ 0 :コナタ "５００万円")

(terpri)

