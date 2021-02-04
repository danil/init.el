(defun init-projectile-rails ()
  (add-hook 'projectile-mode-hook 'projectile-rails-on)

  (if (boundp 'projectile-rails-server-buffer-name) (init-projectile-rails--setup)
    (with-eval-after-load 'projectile-rails (init-projectile-rails--setup))))

(defun init-projectile-rails--setup ()
  ;; Override rails server arguments.
  (defun projectile-rails-server ()
    "Runs rails server command"
    (interactive)
    (if (member projectile-rails-server-buffer-name (mapcar 'buffer-name (buffer-list)))
        (switch-to-buffer projectile-rails-server-buffer-name)
      (projectile-rails-with-root
       (compile (projectile-rails-with-preloader
                 :spring "bundle exec spring rails server --binding=0.0.1.0"
                 :zeus "zeus server --binding=0.0.1.0"
                 :vanilla "bundle exec rails server --binding=0.0.1.0")
                'projectile-rails-server-mode)))))

(provide 'init-projectile-rails)
