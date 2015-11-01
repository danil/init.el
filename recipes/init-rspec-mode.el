(my-init--hook
  (add-hook 'dired-mode-hook 'rspec-dired-mode)
  (custom-set-variables '(rspec-use-spring-when-possible nil))
  
  (my-init--after-load 'rspec-mode
    ;; (setq rspec-use-rvm t)
    (setq rspec-use-rake-when-possible nil)))
