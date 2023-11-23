;;; This file is part of Danil Kutkevich <danil@kutkevich.org> home.

(defun init-rainbow-delimiters ()
  (dolist (h init-programming-modes-hooks)
    (add-hook h 'init-rainbow-delimiters-lazy-init)))

;; <https://ericscrivner.me/2015/06/better-emacs-rainbow-delimiters-color-scheme
(defun init-rainbow-delimiters-lazy-init ()
  (init-lazy init-lazy-seconds nil 'rainbow-delimiters-mode))

(provide 'init-rainbow-delimiters)
