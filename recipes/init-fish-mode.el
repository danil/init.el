(add-hook 'after-init-hook 'noxrcp-fish-mode)

(defun noxrcp-fish-mode ()
  "My init."

  (noxrcp-add-mode-to-patterns 'fish-mode "\\.fish\\'"))
