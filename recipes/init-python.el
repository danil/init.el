(my-init--hook
  (my-init--add-mode-to-patterns 'python-mode "/requirements\\.txt\\'")

  (my-init--after-load 'python
    (define-key python-mode-map (kbd "C-c C-f") nil)))
