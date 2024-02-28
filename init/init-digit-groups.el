;;; This file is part of Danil Kutkevich <danil@kutkevich.org> home.

;;; Highlighting digit groups in numbers.

(defgroup init-digit-groups nil
  "init-digit-groups"
  :group  'editing
  :tag    "init-digit-groups"
  :prefix "init-digit-groups-"
  :link   '(url-link :tag "GitHub" "https://github.com/danil/init.el"))

(defcustom init-digit-groups-mode-hooks '()
  "Hooks for highlighting digits."
  :group 'init-digit-groups)

(defun init-digit-groups ()
  (dolist (h init-digit-groups-mode-hooks)
    (add-hook h 'init-digit-groups-lazy-init)))

(defun init-digit-groups-lazy-init () "Run `digit-groups'."
  (init-lazy init-lazy-seconds nil 'digit-groups-mode +1))

(provide 'init-digit-groups)
