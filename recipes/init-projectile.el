(my-init--hook
  (custom-set-variables
   '(projectile-mode-line
     '(:eval (format " P[%s]" (projectile-project-name)))))

  (projectile-global-mode))
