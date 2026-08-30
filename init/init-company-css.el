;;; -*- lexical-binding: t; -*-
;;; This file is part of Danil Kutkevich <danil@kutkevich.org> home.

(defun init-company-css ()
  (if (boundp 'company-mode-map) (init-company-css-init)
    (with-eval-after-load 'company (init-company-css-init))))

(defun init-company-css-init ()
  (add-hook 'css-mode-hook 'init-company-css--init))

(defun init-company-css--init ()
  (set (make-local-variable 'company-backends)
       (append '((
                  company-css
                  company-dabbrev-code
                  company-gtags
                  company-etags
                  company-keywords
                  )) company-backends)))

(provide 'init-company-css)
