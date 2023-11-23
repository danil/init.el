(defgroup init-deft nil
  "init-deft"
  :group  'editing
  :tag    "init-deft"
  :prefix "init-deft-"
  :link   '(url-link :tag "GitHub" "https://github.com/danil/init.el"))

(defun init-deft-init (&optional arg)
  "Open `deft' list or create `deft' item if `ARG'."
  (interactive "P")
  (if arg (deft-new-file) (deft)))

(provide 'init-deft)
