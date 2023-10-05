(defun init-tramp-cache ()
  (setq tramp-persistency-file-name (file-name-concat init-emacs-var "tramp")))

(provide 'init-tramp-cache)
