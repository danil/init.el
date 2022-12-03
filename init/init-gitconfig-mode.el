(defgroup init-gitconfig-mode nil
  "init-gitconfig-mode"
  :group  'editing
  :tag    "init-gitconfig-mode"
  :prefix "init-gitconfig-mode-"
  :link   '(url-link :tag "GitHub" "https://github.com/tonini/gitconfig.el"))

(defcustom init-gitconfig-mode-patterns '()
  "Regexp patterns associated with `gitconfig-mode'."
  :group 'init-gitconfig-mode)

(defun init-gitconfig-mode ()
  (dolist (pattern-mode-pair init-gitconfig-mode-patterns)
    (let ((pattern (nth 0 pattern-mode-pair))
          (mode (nth 1 pattern-mode-pair)))
      (add-to-list 'auto-mode-alist (cons pattern mode)))))

(provide 'init-gitconfig-mode)
