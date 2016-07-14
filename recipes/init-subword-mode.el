(add-hook 'after-init-hook 'init-subword-mode)

(defun init-subword-mode ()
  "Init."

  (my-init--add-mode-to-hooks 'subword-mode
                         (append my-init--programming-modes-hooks
                                 '(ag-mode-hook ibuffer-mode-hook))))
