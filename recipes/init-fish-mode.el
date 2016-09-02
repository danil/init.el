(add-hook 'after-init-hook 'init-fish-mode)

(defun init-fish-mode ()
  "Init."

  (myinit--add-mode-to-patterns 'fish-mode "\\.fish\\'"))
