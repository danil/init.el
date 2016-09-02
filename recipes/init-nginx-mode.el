(custom-set-variables '(nginx-indent-level 2))

(add-hook 'after-init-hook 'init-nginx-mode)

(defun init-nginx-mode ()
  "Init."

  (myinit--add-mode-to-patterns 'nginx-mode
                                "/etc/nginx/.*\\.conf\\'"
                                "/etc/nginx/sites-available/"))
