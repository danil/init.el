(my-init--hook
  (my-init--add-mode-to-patterns 'makefile-gmake-mode
                                "/etc/portage/savedconfig/x11-misc/slock")

  (my-init--after-load 'make-mode
    (define-key makefile-mode-map (kbd "C-c C-f") nil)))
