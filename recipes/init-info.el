(add-hook 'after-init-hook 'init-info)

(defun init-info ()
  "Init."

  (my-init--add-mode-to-patterns 'Info-mode "\\.info\\'"))
