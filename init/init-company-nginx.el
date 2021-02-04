(defun init-company-nginx ()
  "No X recipe init."

  (if (fboundp 'company-nginx) (init-company-nginx--setup)
    (with-eval-after-load 'company-nginx (init-company-nginx--setup))))

(defun init-company-nginx--setup ()
  (add-hook 'nginx-mode-hook 'init-company-nginx---setup))

(defun init-company-nginx---setup ()
  ;; (eval-after-load 'nginx-mode
  ;;   '(add-hook 'nginx-mode-hook #'company-nginx-keywords))
  (set (make-local-variable 'company-backends)
       (append '((
                  company-nginx
                  company-dabbrev-code
                  company-gtags
                  company-etags
                  company-keywords
                  )) company-backends)))

(provide 'init-company-nginx)
