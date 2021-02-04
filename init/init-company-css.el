(defun init-company-css ()
  (if (boundp 'company-mode-map) (init-company-css--setup)
    (with-eval-after-load 'company (init-company-css--setup))))

(defun init-company-css--setup ()
  (add-hook 'css-mode-hook 'init-company-css---setup))

(defun init-company-css---setup ()
  (set (make-local-variable 'company-backends)
       (append '((
                  company-css
                  company-dabbrev-code
                  company-gtags
                  company-etags
                  company-keywords
                  )) company-backends)))

(provide 'init-company-css)
