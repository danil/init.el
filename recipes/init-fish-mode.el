(add-hook 'after-init-hook 'myinit-fish-mode)

(defun myinit-fish-mode ()
  "My init."

  (myinit-add-mode-to-patterns 'fish-mode "\\.fish\\'"))
