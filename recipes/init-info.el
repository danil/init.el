(add-hook 'after-init-hook 'init-info)

(defun init-info ()
  "Init."

  (myinit--add-mode-to-patterns 'Info-mode "\\.info\\'"))
