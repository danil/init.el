(custom-set-variables '(nginx-indent-level 2))

(my-after-init
  (my-add-auto-mode-to-patterns 'nginx-mode
                                "/etc/nginx/.*\\.conf\\'"
                                "/etc/nginx/sites-available/"))
