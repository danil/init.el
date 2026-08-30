;;; -*- lexical-binding: t; -*-
;;; This file is part of Danil Kutkevich <danil@kutkevich.org> home.

(defun init-company-elisp ()
  (if (boundp 'company-mode-map) (init-company-elisp-init)
    (with-eval-after-load 'company (init-company-elisp-init))))

(defun init-company-elisp-init ()
  (add-hook 'emacs-lisp-mode-hook 'init-company-elisp--init))

(defun init-company-elisp--init ()
  (set (make-local-variable 'company-backends)
       (append '((
                  company-elisp
                  company-dabbrev-code
                  company-gtags
                  company-etags
                  company-keywords
                  )) company-backends)))

(provide 'init-company-elisp)
