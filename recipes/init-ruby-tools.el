(my-init--hook
  (my-init--add-mode-to-hooks 'ruby-tools-mode my-init--ruby-tools-hooks)

  (my-init--after-load 'ruby-tools
    ;; Remove keys from a minor-mode keymap
    ;; <http://stackoverflow.com/questions/7598433/how-to-remove-a-key-from-a-minor-mode-keymap-in-emacs#7598754>.
    (define-key ruby-tools-mode-map (kbd "C-'")  nil)
    (define-key ruby-tools-mode-map (kbd "C-\"") nil)
    (define-key ruby-tools-mode-map (kbd "C-:")  nil)
    (define-key ruby-tools-mode-map (kbd "C-;")  nil)
    (define-key ruby-tools-mode-map (kbd "#")    nil)
    (define-key ruby-tools-mode-map (my-kbd "m r '")
      'ruby-tools-to-single-quote-string)
    (define-key ruby-tools-mode-map (my-kbd "m r \"")
      'ruby-tools-to-double-quote-string)
    (define-key ruby-tools-mode-map (my-kbd "m r :")
      'ruby-tools-to-symbol)
    (define-key ruby-tools-mode-map (my-kbd "m r ;")
      'ruby-tools-clear-string)
    (define-key ruby-tools-mode-map (my-kbd "m r #")
      'ruby-tools-interpolate)))
