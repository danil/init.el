(my-after-init
  (my-add-mode-to-hooks 'subword-mode
                         (append my-init--programming-modes-hooks
                                 '(ag-mode-hook ibuffer-mode-hook))))
