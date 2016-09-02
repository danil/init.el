(add-hook 'after-init-hook 'myinit-info)

(defun myinit-info ()
  "My init."

  (myinit--add-mode-to-patterns 'Info-mode "\\.info\\'"))
