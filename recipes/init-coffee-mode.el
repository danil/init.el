(my-init--hook
  (my-init--add-mode-to-patterns 'coffee-mode "\\.coffee\\'" "/Cakefile\\'")

  (custom-set-variables '(coffee-tab-width 2))

  (my-init--after-load 'coffee-mode
    ;; (set (make-local-variable 'tab-width) 2)
    (setq coffee-js-mode ;coffee mode defaults to js2-mode, which is not present in Emacs by default
          (if (fboundp 'js2-mode) 'js2-mode 'javascript-mode))))
