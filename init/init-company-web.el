(defun init-company-web ()
  (if (boundp 'company-mode) (init-company-web--setup)
    (with-eval-after-load 'company (init-company-web--setup))))

(defun init-company-web--setup ()
  (add-hook 'html-mode-hook 'init-company-web--setup-web-mode)
  (add-hook 'jade-mode-hook 'init-company-web--setup-jade-mode)
  (add-hook 'slim-mode-hook 'init-company-web--setup-slim-mode)
  (add-hook 'web-mode-hook 'init-company-web--setup-web-mode))

(defun init-company-web--setup-web-mode ()
  (set (make-local-variable 'company-backends)
       (append '((
                  company-web-html
                  company-dabbrev-code
                  company-gtags
                  company-etags
                  company-keywords
                  )) company-backends)))

(defun init-company-web--setup-jade-mode ()
  (set (make-local-variable 'company-backends)
       (append '((
                  company-web-jade
                  company-dabbrev-code
                  company-gtags
                  company-etags
                  company-keywords
                  )) company-backends)))

(defun init-company-web--setup-slim-mode ()
  (set (make-local-variable 'company-backends)
       (append '((
                  company-web-slim
                  company-dabbrev-code
                  company-gtags
                  company-etags
                  company-keywords
                  )) company-backends)))

(provide 'init-company-web)
