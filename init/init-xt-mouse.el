;;; -*- lexical-binding: t; -*-
;;; This file is part of Danil Kutkevich <danil@kutkevich.org> home.

(defgroup init-xt-mouse nil
  "init-xt-mouse"
  :group  'editing
  :tag    "init-xt-mouse"
  :prefix "init-xt-mouse-"
  :link   '(url-link :tag "GitHub" "https://github.com/danil/init.el"))

(defun init-xt-mouse ()
  (if (boundp 'xterm-mouse-mode) (init-xt-mouse-init)
    (with-eval-after-load 'xt-mouse (init-xt-mouse-init))))

(defun init-xt-mouse-init () (xterm-mouse-mode t))

(provide 'init-xt-mouse)
