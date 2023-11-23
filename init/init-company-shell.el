;;; This file is part of Danil Kutkevich <danil@kutkevich.org> home.

(defun init-company-shell ()
  (if (boundp 'company-mode) (init-company-shell-init)
    (with-eval-after-load 'company (init-company-shell-init))))

(defun init-company-shell-init ()
  (add-hook 'sh-mode-hook 'init-company-shell--init)
  (add-hook 'shell-mode-hook 'init-company-shell--init))

(defun init-company-shell--init ()
  ;; (add-to-list 'company-backends '(company-shell company-shell-env company-fish-shell))
  (set (make-local-variable 'company-backends)
       (append '((
                  company-shell
                  company-files
                  company-dabbrev-code
                  company-gtags
                  company-etags
                  company-keywords
                  )) company-backends)))

(provide 'init-company-shell)
