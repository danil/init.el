(add-hook 'after-init-hook 'noxrcp-fish-mode)

(defun noxrcp-fish-mode ()
  "No X recipe init."

  (noxrcp-add-mode-to-patterns 'fish-mode "\\.fish\\'"))
