(defun init-company-erlang ()
  (if (boundp 'company-mode) (init-company-erlang--setup)
    (with-eval-after-load 'company (init-company-erlang--setup))))

(defun init-company-erlang--setup ()
  (add-hook 'erlang-mode-hook 'init-company-erlang---setup))

(defun init-company-erlang---setup ()
  (set (make-local-variable 'company-backends)
       (append '((
                  company-erlang
                  company-dabbrev-code
                  company-gtags
                  company-etags
                  company-keywords
                  )) company-backends)))

(provide 'init-company-erlang)
