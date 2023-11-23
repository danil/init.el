;;; This file is part of Danil Kutkevich <danil@kutkevich.org> home.

(defun init-company-inf-ruby ()
  (if (boundp 'company-mode) (init-company-inf-ruby-init)
    (with-eval-after-load 'company (init-company-inf-ruby-init))))

(defun init-company-inf-ruby-init ()
  (add-hook 'inf-ruby-mode-hook 'init-company-inf-ruby--init)
  (add-hook 'ruby-mode-hook 'init-company-inf-ruby--init))

(defun init-company-inf-ruby--init ()
  (set (make-local-variable 'company-backends)
       (append '((
                  company-inf-ruby
                  company-dabbrev-code
                  company-gtags
                  company-etags
                  company-keywords
                  )) company-backends)))

(provide 'init-company-inf-ruby)
