(my-after-init
  (my-add-auto-mode-to-patterns 'python-mode "/requirements\\.txt\\'")

  (my-eval-after-load 'python
    (define-key python-mode-map (kbd "C-c C-f") nil)))
