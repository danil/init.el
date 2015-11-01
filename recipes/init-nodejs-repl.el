(my-init--hook
  ;; (custom-set-variables '(nodejs-repl-command "~/.nvm/v0.11.13/bin/node"))

  (my-init--after-load 'js
    (define-key js-mode-map (kbd "C-c C-z") 'nodejs-repl))

  (my-init--after-load 'js2-mode
    (define-key js2-mode-map (kbd "C-c C-z") 'nodejs-repl)))
