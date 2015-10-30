(my-after-init
  (my-eval-after-load 'php-mode
    (define-key php-mode-map (kbd "C-c C-f") nil)))
