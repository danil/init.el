;;; -*- lexical-binding: t; -*-
;;; This file is part of Danil Kutkevich <danil@kutkevich.org> home.

(defun init-company-nginx ()
  "No X recipe init."

  (if (fboundp 'company-nginx) (init-company-nginx-init)
    (with-eval-after-load 'company-nginx (init-company-nginx-init))))

(defun init-company-nginx-init ()
  (add-hook 'nginx-mode-hook 'init-company-nginx--init))

(defun init-company-nginx--init ()
  ;; (eval-after-load 'nginx-mode
  ;;   '(add-hook 'nginx-mode-hook #'company-nginx-keywords))
  (set (make-local-variable 'company-backends)
       (append '((
                  company-nginx
                  company-dabbrev-code
                  company-gtags
                  company-etags
                  company-keywords
                  )) company-backends)))

(provide 'init-company-nginx)
