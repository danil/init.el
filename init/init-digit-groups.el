;;; highlighting digit groups in numbers.

(defgroup init-digit-groups nil
  "init-digit-groups"
  :group  'editing
  :tag    "init-digit-groups"
  :prefix "init-digit-groups-"
  :link   '(url-link :tag "GitHub" "https://github.com/danil/init.el"))

(defcustom init-digit-groups-mode-hooks '()
  "Hooks with highlight digits."
  :group 'init-digit-groups)

(defun init-digit-groups ()
  (dolist (h init-digit-groups-mode-hooks)
    (add-hook h 'init-digit-groups-lazy-setup)))

(defun init-digit-groups-lazy-setup () "Run `digit-groups'."
  (init-lazy init-lazy-seconds nil 'digit-groups-mode +1))

(provide 'init-digit-groups)
