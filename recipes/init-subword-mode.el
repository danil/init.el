(add-hook 'after-init-hook 'init-subword-mode)

(defun init-subword-mode ()
  "Init."

  (myinit--add-mode-to-hooks 'subword-mode
                         (append myinit--programming-modes-hooks
                                 '(ag-mode-hook ibuffer-mode-hook))))
