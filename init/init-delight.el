;;; -*- lexical-binding: t; -*-
;;; This file is part of Danil Kutkevich <danil@kutkevich.org> home.

(defgroup init-delight nil
  "init-delight"
  :group  'editing
  :tag    "init-delight"
  :prefix "init-delight-"
  :link   '(url-link :tag "GitHub" "https://github.com/danil/init.el"))

(defun init-delight ()
(init-delight-init)
  ;; (if (boundp 'delighted-modes) (init-delight-init)
  ;;   (with-eval-after-load 'delight (init-delight-init)))
  )

(defun init-delight-init ()
  ;; (with-eval-after-load 'abbrev (delight '((abbrev-mode nil))))
  )

(provide 'init-delight)
