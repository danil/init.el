(my-after-init
  (my-add-auto-mode-to-patterns 'shell-script-mode
                                "/Procfile\\'"
                                "/\\.ackrc\\'"
                                "/\\.bash_aliases\\'"
                                "/\\.bpkgrc\\'"
                                "/\\.lessfilter\\'"
                                "/\\.mkshrc\\'"
                                "/\\.xprofile\\'"
                                "/dwmrc\\'")
  ;; Cron.
  (my-add-auto-mode-to-patterns 'shell-script-mode
                                "/anacrontab\\'"
                                "/crontab\\'")

  ;; Gentoo.
  (my-add-auto-mode-to-patterns 'shell-script-mode
                                "/etc/init.d/"
                                "/etc/local.d/.+\\.\\(start\\|stop\\)")

  (my-eval-after-load 'sh-script
    (define-key sh-mode-map (kbd "C-c C-f") nil)))
