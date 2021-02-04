(defun init-column-marker ()
  (autoload 'column-marker-1 "column-marker" nil t)

  (dolist (h init-programming-modes-hooks)
    (add-hook h 'init-column-marker-lazy-setup)))

(defun init-column-marker-lazy-setup ()
  (init-lazy init-lazy-seconds nil (lambda () (column-marker-1 79))))

(provide 'init-column-marker)
