(defun init-company-elisp ()
  (if (boundp 'company-mode-map) (init-company-elisp--setup)
    (with-eval-after-load 'company (init-company-elisp--setup))))

(defun init-company-elisp--setup ()
  (add-hook 'emacs-lisp-mode-hook 'init-company-elisp---setup))

(defun init-company-elisp---setup ()
  (set (make-local-variable 'company-backends)
       (append '((
                  company-elisp
                  company-dabbrev-code
                  company-gtags
                  company-etags
                  company-keywords
                  )) company-backends)))

(provide 'init-company-elisp)
