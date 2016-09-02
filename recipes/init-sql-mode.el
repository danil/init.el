(add-hook 'after-init-hook 'init-sql-mode)

(defun init-sql-mode ()
  "Init."

  (myinit--add-mode-to-patterns 'sql-mode
                                "/\.?psqlrc\\'"))
