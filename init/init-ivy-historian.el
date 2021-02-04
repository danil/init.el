(defun init-ivy-historian ()
  (if (boundp 'ivy-historian-mode) (init-ivy-historian--setup)
    (with-eval-after-load 'ivy-historian (init-ivy-historian--setup))))

(defun init-ivy-historian--setup () (ivy-historian-mode t))

(provide 'init-ivy-historian)
