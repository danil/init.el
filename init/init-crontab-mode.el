(defgroup init-crontab-mode nil
  "init-crontab-mode"
  :group  'editing
  :tag    "init-crontab-mode"
  :prefix "init-crontab-mode-"
  :link   '(url-link :tag "GitHub" "https://github.com/danil/init.el"))

(defcustom init-crontab-mode-patterns '()
  "Regexp patterns associated with `crontab-mod'."
  :group 'crontab-mode)

(defun init-crontab-mode ()
  (dolist (pattern init-crontab-mode-patterns)
    (add-to-list 'auto-mode-alist (cons pattern 'crontab-mode))))

(provide 'init-crontab-mode)
