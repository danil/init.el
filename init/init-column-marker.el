;;; -*- lexical-binding: t; -*-
;;; This file is part of Danil Kutkevich <danil@kutkevich.org> home.

(defun init-column-marker ()
  (autoload 'column-marker-1 "column-marker" nil t)

  (dolist (h init-programming-modes-hooks)
    (add-hook h 'init-column-marker-lazy-init)))

(defun init-column-marker-lazy-init ()
  (init-lazy init-lazy-seconds nil (lambda () (column-marker-1 79))))

(provide 'init-column-marker)
