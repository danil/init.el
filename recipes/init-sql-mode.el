(add-hook 'after-init-hook 'init-sql-mode)

(defun init-sql-mode ()
  "Init."

  (my-init--add-mode-to-patterns 'sql-mode
                                "/\.?psqlrc\\'"))
