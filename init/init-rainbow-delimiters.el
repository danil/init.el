(defun init-rainbow-delimiters ()
  (dolist (h init-programming-modes-hooks)
    (add-hook h 'init-rainbow-delimiters-lazy-setup)))

;; <https://ericscrivner.me/2015/06/better-emacs-rainbow-delimiters-color-scheme
(defun init-rainbow-delimiters-lazy-setup ()
  (init-lazy init-lazy-seconds nil 'rainbow-delimiters-mode))

(provide 'init-rainbow-delimiters)
