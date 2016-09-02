(add-hook 'after-init-hook 'myinit-subword-mode)

(defun myinit-subword-mode ()
  "My init."

  (myinit-add-mode-to-hooks 'subword-mode
                         (append myinit-programming-modes-hooks
                                 '(ag-mode-hook ibuffer-mode-hook))))
