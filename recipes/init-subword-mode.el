(add-hook 'after-init-hook 'noxrcp-subword-mode)

(defun noxrcp-subword-mode ()
  "No X recipe init."

  (noxrcp-add-mode-to-hooks 'subword-mode
                         (append noxrcp-programming-modes-hooks
                                 '(ag-mode-hook ibuffer-mode-hook))))
