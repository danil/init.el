(custom-set-variables '(nginx-indent-level 2))

(add-hook 'after-init-hook 'myinit-nginx-mode)

(defun myinit-nginx-mode ()
  "My init."

  (myinit-add-mode-to-patterns 'nginx-mode
                                "/etc/nginx/.*\\.conf\\'"
                                "/etc/nginx/sites-available/"))
