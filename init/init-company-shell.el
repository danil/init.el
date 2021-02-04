(defun init-company-shell ()
  (if (boundp 'company-mode) (init-company-shell--setup)
    (with-eval-after-load 'company (init-company-shell--setup))))

(defun init-company-shell--setup ()
  (add-hook 'sh-mode-hook 'init-company-shell---setup)
  (add-hook 'shell-mode-hook 'init-company-shell---setup))

(defun init-company-shell---setup ()
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
