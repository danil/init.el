(my-after-init
  (my-autoload-file-on-functions "expand-region"
                                 'er/expand-region
                                 'er/mark-comment
                                 'er/mark-defun
                                 'er/mark-email
                                 'er/mark-inside-pairs
                                 'er/mark-inside-quotes
                                 'er/mark-method-call
                                 'er/mark-next-accessor
                                 'er/mark-outside-pairs
                                 'er/mark-outside-quotes
                                 'er/mark-symbol
                                 'er/mark-symbol-with-prefix
                                 'er/mark-url
                                 'er/mark-word)

  (global-set-key (my-kbd "e e") 'er/expand-region)

  (global-set-key (my-kbd "e c") 'er/mark-comment)
  (global-set-key (my-kbd "e d") 'er/mark-defun)
  (global-set-key (my-kbd "e m c") 'er/mark-method-call)
  (global-set-key (my-kbd "e m m") 'er/mark-email)
  (global-set-key (my-kbd "e n") 'er/mark-next-accessor)
  (global-set-key (my-kbd "e p i") 'er/mark-inside-pairs)
  (global-set-key (my-kbd "e p o") 'er/mark-outside-pairs)
  (global-set-key (my-kbd "e q i") 'er/mark-inside-quotes)
  (global-set-key (my-kbd "e q o") 'er/mark-outside-quotes)
  (global-set-key (my-kbd "e s p") 'er/mark-symbol-with-prefix)
  (global-set-key (my-kbd "e s s") 'er/mark-symbol)
  (global-set-key (my-kbd "e u") 'er/mark-url)
  (global-set-key (my-kbd "e w") 'er/mark-word))
