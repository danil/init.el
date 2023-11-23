;;; This file is part of Danil Kutkevich <danil@kutkevich.org> home.

(defun init-company-erlang ()
  (if (boundp 'company-mode) (init-company-erlang-init)
    (with-eval-after-load 'company (init-company-erlang-init))))

(defun init-company-erlang-init ()
  (add-hook 'erlang-mode-hook 'init-company-erlang--init))

(defun init-company-erlang--init ()
  (set (make-local-variable 'company-backends)
       (append '((
                  company-erlang
                  company-dabbrev-code
                  company-gtags
                  company-etags
                  company-keywords
                  )) company-backends)))

(provide 'init-company-erlang)
