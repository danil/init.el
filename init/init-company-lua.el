;;; This file is part of Danil Kutkevich <danil@kutkevich.org> home.

(defun init-company-lua ()
  (if (boundp 'company-mode) (init-company-lua-init)
    (with-eval-after-load 'company (init-company-lua-init))))

(defun init-company-lua-init ()
  (add-hook 'lua-mode-hook 'init-company-lua--init))

(defun init-company-lua--init ()
  (set (make-local-variable 'company-backends)
       (append '((
                  company-lua
                  company-dabbrev-code
                  company-gtags
                  company-etags
                  company-keywords
                  )) company-backends)))

(provide 'init-company-lua)
