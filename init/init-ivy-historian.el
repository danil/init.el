;;; This file is part of Danil Kutkevich <danil@kutkevich.org> home.

(defun init-ivy-historian ()
  (if (boundp 'ivy-historian-mode) (init-ivy-historian-init)
    (with-eval-after-load 'ivy-historian (init-ivy-historian-init))))

(defun init-ivy-historian-init () (ivy-historian-mode t))

(provide 'init-ivy-historian)
