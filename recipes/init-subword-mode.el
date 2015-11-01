(my-init--hook
  (my-init--add-mode-to-hooks 'subword-mode
                         (append my-init--programming-modes-hooks
                                 '(ag-mode-hook ibuffer-mode-hook))))
