(add-hook 'projectile-mode-hook 'projectile-rails-on)

(add-hook 'after-init-hook 'noxrcp-projectile-rails)

(defun noxrcp-projectile-rails ()
  "No X recipe init."

  (noxrcp-after-load 'projectile-rails

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
                  'projectile-rails-server-mode))))))
