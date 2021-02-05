(add-hook 'after-init-hook 'noxrcp-info)

(defun noxrcp-info ()
  "No X recipe init."

  (noxrcp-removeme-add-mode-to-patterns 'Info-mode "\\.info\\'"))
