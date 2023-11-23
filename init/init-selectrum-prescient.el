;;; This file is part of Danil Kutkevich <danil@kutkevich.org> home.

(defun init-selectrum-prescient ()
  (if (boundp 'selectrum-mode) (init-selectrum-prescient-init)
    (with-eval-after-load 'selectrum (init-selectrum-prescient-init))))

(defun init-selectrum-prescient-init ()
  ;; to make sorting and filtering more intelligent
  (selectrum-prescient-mode +1))

(provide 'init-selectrum-prescient)
