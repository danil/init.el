;;; This file is part of Danil Kutkevich <danil@kutkevich.org> home.

(defgroup init-subr nil
  "init-subr"
  :group  'editing
  :tag    "init-subr"
  :prefix "init-subr-"
  :link   '(url-link :tag "GitHub" "https://github.com/danil/init.el"))

(defun init-subr () (when (boundp 'esc-map) (init-subr-init)))
(defun init-subr-init () (define-key esc-map "." nil))

(defun init-subr-insert-timestamp-unix ()
  (interactive)
  (insert (format-time-string "%s" nil "UTC0")))

(defun init-subr-insert-timestamp-datetime ()
  (interactive)
  (insert (format-time-string "%Y%m%dT%H%M%SZ" nil "UTC0")))

(defun init-subr-insert-timestamp-date ()
  (interactive)
  (insert (format-time-string "%Y%m%d" nil "UTC0")))

(provide 'init-subr)
