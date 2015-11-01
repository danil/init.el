(my-init--hook
  (my-init--after-load 'twittering-mode
    (define-key twittering-mode-map (kbd "C-c C-f") nil)))
