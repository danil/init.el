(defun init-company-lua ()
  (if (boundp 'company-mode) (init-company-lua--setup)
    (with-eval-after-load 'company (init-company-lua--setup))))

(defun init-company-lua--setup ()
  (add-hook 'lua-mode-hook 'init-company-lua---setup))

(defun init-company-lua---setup ()
  (set (make-local-variable 'company-backends)
       (append '((
                  company-lua
                  company-dabbrev-code
                  company-gtags
                  company-etags
                  company-keywords
                  )) company-backends)))

(provide 'init-company-lua)
