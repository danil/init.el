(defgroup init-rainbow-mode nil
  "init-rainbow-mode"
  :group  'editing
  :tag    "init-rainbow-mode"
  :prefix "init-rainbow-mode-"
  :link   '(url-link :tag "GitHub" "https://github.com/danil/init.el"))

(defcustom init-rainbow-mode-hooks '()
  "Major mode hooks associated with `rainbow-modes'." :group 'init-rainbow-mode)

(defun init-rainbow-mode ()
  (dolist (hook init-rainbow-mode-hooks)
    (add-hook hook 'init-rainbow-mode-lazy-init)))

(defun init-rainbow-mode-lazy-init ()
  (init-lazy init-lazy-seconds nil (lambda () (rainbow-mode t))))

(provide 'init-rainbow-mode)
