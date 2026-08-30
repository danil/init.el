;;; -*- lexical-binding: t; -*-
;;; This file is part of Danil Kutkevich <danil@kutkevich.org> home.

(defgroup init-hi-lock nil
  "init-hi-lock"
  :group  'editing
  :tag    "init-hi-lock"
  :prefix "init-hi-lock-"
  :link   '(url-link :tag "GitHub" "https://github.com/danil/init.el"))

(defun init-highlight-regexp (&optional arg)
  (interactive "P")
  (if arg (call-interactively 'unhighlight-regexp)
    (call-interactively 'highlight-regexp)))

(provide 'hi-lock)
