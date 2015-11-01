(custom-set-variables '(nginx-indent-level 2))

(my-init--hook
  (my-init--add-mode-to-patterns 'nginx-mode
                                "/etc/nginx/.*\\.conf\\'"
                                "/etc/nginx/sites-available/"))
