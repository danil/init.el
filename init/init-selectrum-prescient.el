(defun init-selectrum-prescient ()
  (if (boundp 'selectrum-mode) (init-selectrum-prescient--setup)
    (with-eval-after-load 'selectrum (init-selectrum-prescient--setup))))

(defun init-selectrum-prescient--setup ()
  ;; to make sorting and filtering more intelligent
  (selectrum-prescient-mode +1))

(provide 'init-selectrum-prescient)
