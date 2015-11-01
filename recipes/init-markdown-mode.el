(my-init--hook
  (my-init--add-mode-to-patterns 'markdown-mode
                                "/README\\'"
                                "/mutt[-a-zA-Z0-9]+\\'"
                                "\\.markdown\\'"
                                "\\.md\\'"
                                "\\.mdown\\'")

 (my-init--after-load 'markdown-mode
   ;; Unset markdown-next-wiki-link and markdown-previous-wiki-link
   ;; <http://stackoverflow.com/questions/7598433/how-to-remove-a-key-from-a-minor-mode-keymap-in-emacs#7598754>.
   (define-key markdown-mode-map "\M-n" nil)
   (define-key markdown-mode-map "\M-p" nil)
   (define-key markdown-mode-map (kbd "C-c C-f") nil)))
