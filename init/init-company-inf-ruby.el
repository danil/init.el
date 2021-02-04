(defun init-company-inf-ruby ()
  (if (boundp 'company-mode) (init-company-inf-ruby--setup)
    (with-eval-after-load 'company (init-company-inf-ruby--setup))))

(defun init-company-inf-ruby--setup ()
  (add-hook 'inf-ruby-mode-hook 'init-company-inf-ruby---setup)
  (add-hook 'ruby-mode-hook 'init-company-inf-ruby---setup))

(defun init-company-inf-ruby---setup ()
  (set (make-local-variable 'company-backends)
       (append '((
                  company-inf-ruby
                  company-dabbrev-code
                  company-gtags
                  company-etags
                  company-keywords
                  )) company-backends)))

(provide 'init-company-inf-ruby)
