(defun init-company-web ()
  (if (boundp 'company-mode) (init-company-web-init)
    (with-eval-after-load 'company (init-company-web-init))))

(defun init-company-web-init ()
  (add-hook 'html-mode-hook 'init-company-web-init-web-mode)
  (add-hook 'jade-mode-hook 'init-company-web-init-jade-mode)
  (add-hook 'slim-mode-hook 'init-company-web-init-slim-mode)
  (add-hook 'web-mode-hook 'init-company-web-init-web-mode))

(defun init-company-web-init-web-mode ()
  (set (make-local-variable 'company-backends)
       (append '((
                  company-web-html
                  company-dabbrev-code
                  company-gtags
                  company-etags
                  company-keywords
                  )) company-backends)))

(defun init-company-web-init-jade-mode ()
  (set (make-local-variable 'company-backends)
       (append '((
                  company-web-jade
                  company-dabbrev-code
                  company-gtags
                  company-etags
                  company-keywords
                  )) company-backends)))

(defun init-company-web-init-slim-mode ()
  (set (make-local-variable 'company-backends)
       (append '((
                  company-web-slim
                  company-dabbrev-code
                  company-gtags
                  company-etags
                  company-keywords
                  )) company-backends)))

(provide 'init-company-web)
