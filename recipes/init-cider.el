(custom-set-variables '(cider-mode-line " cider"))

(my-after-init
  (my-eval-after-load 'cider-mode
    (define-key cider-mode-map (kbd "C-c C-f") nil)))
