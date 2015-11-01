(my-init--hook
  (my-init--add-mode-to-patterns 'shell-script-mode
                                "/Procfile\\'"
                                "/\\.ackrc\\'"
                                "/\\.bash_aliases\\'"
                                "/\\.bpkgrc\\'"
                                "/\\.lessfilter\\'"
                                "/\\.mkshrc\\'"
                                "/\\.xprofile\\'"
                                "/dwmrc\\'")
  ;; Cron.
  (my-init--add-mode-to-patterns 'shell-script-mode
                                "/anacrontab\\'"
                                "/crontab\\'")

  ;; Gentoo.
  (my-init--add-mode-to-patterns 'shell-script-mode
                                "/etc/init.d/"
                                "/etc/local.d/.+\\.\\(start\\|stop\\)")

  (my-init--after-load 'sh-script
    (define-key sh-mode-map (kbd "C-c C-f") nil)))
