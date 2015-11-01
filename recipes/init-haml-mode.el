(my-init--hook
  (my-init--after-load 'haml-mode
    ;; (my-init--after-load 'ruby-mode
    ;;   (define-key haml-mode-map (my-kbd "m r h") 'ruby-toggle-hash-syntax))
    (define-key haml-mode-map "\C-c\C-f" nil)))
