(add-hook 'after-init-hook 'noxrcp-info)

(defun noxrcp-info ()
  "My init."

  (noxrcp-add-mode-to-patterns 'Info-mode "\\.info\\'"))
