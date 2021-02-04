;;; FIXME: insaned nested hook

(defun init-diredfl ()
  (if (boundp 'dired-after-readin-hook) (init-diredfl--lazy-init)
    (with-eval-after-load 'dired (init-diredfl--lazy-init))))

(defun init-diredfl--lazy-init ()
  (init-lazy (/ init-lazy-seconds 2) nil 'require 'diredfl)
  (add-hook 'dired-after-readin-hook 'init-diredfl--lazy-setup))

(defun init-diredfl--lazy-setup ()
  (remove-hook 'dired-after-readin-hook 'init-diredfl--lazy-init)
  (init-lazy init-lazy-seconds nil 'init-diredfl---lazy-setup))

(defun init-diredfl---lazy-setup ()
  "Run `diredfl'."
  (diredfl-mode)
  (add-hook 'dired-after-readin-hook 'diredfl-mode))

(provide 'init-diredfl)
