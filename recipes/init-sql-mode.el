(add-hook 'after-init-hook 'myinit-sql-mode)

(defun myinit-sql-mode ()
  "My init."

  (myinit-add-mode-to-patterns 'sql-mode
                                "/\.?psqlrc\\'"))
