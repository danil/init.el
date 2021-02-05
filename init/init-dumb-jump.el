(defun init-dumb-jump ()
  (dumb-jump-mode +1)

  (if (boundp 'dumb-jump-mode-map) (init-dumb-jump--setup)
    (with-eval-after-load 'dumb-jump (init-dumb-jump--setup))))

(defun init-dumb-jump--setup ()
  (define-key dumb-jump-mode-map (kbd "C-M-g") nil)
  (define-key dumb-jump-mode-map (kbd "C-M-p") nil)

  (if (boundp 'c-mode-map) (init-dumb-jump--setup-c-mode)
    (with-eval-after-load 'cc-mode (init-dumb-jump--setup-c-mode)))

  (if (boundp 'enh-ruby-mode-map) (init-dumb-jump--setup-enh-ruby-mode)
    (with-eval-after-load 'enh-ruby-mode (init-dumb-jump--setup-enh-ruby-mode)))

  (if (boundp 'ruby-mode-map) (init-dumb-jump--setup-ruby-mode)
    (with-eval-after-load 'ruby-mode (init-dumb-jump--setup-ruby-mode))))

(defun init-dumb-jump--setup-c-mode ()
  (define-key c-mode-map (kbd "C-c C-j") 'init-dumb-jump--go))

(defun init-dumb-jump--setup-enh-ruby-mode ()
  (define-key enh-ruby-mode-map (kbd "C-c C-j") 'init-dumb-jump--go))

(defun init-dumb-jump--setup-ruby-mode ()
  (define-key ruby-mode-map (kbd "C-c C-j") 'init-dumb-jump--go))

(defun init-dumb-jump--go ()
  (interactive)
  (if (not current-prefix-arg)
      (call-interactively 'init-dumb-jump---go)
    (let ((current-prefix-arg 'nil))
      (cond
       ((equal current-prefix-arg 4)
        (call-interactively 'xref-find-apropos))
       (t
        (call-interactively 'xref-find-apropos))))))

(defun init-dumb-jump---go ()
  (interactive)
  (dumb-jump-go)
  (let* ((one-more-repeat t)
         (keynames '("j" "k")))
    (while one-more-repeat
      (message "Dumb jump: `j' jump to the definition; `k' jumps back")
      (let* ((event (read-event))
             (keyname (format-kbd-macro (vector event) nil)))
        (clear-this-command-keys t)
        (if (member keyname keynames)
            (progn
              (cond ((equal keyname "j") (dumb-jump-go))
                    ((equal keyname "k") (dumb-jump-back)))
              (setq last-input-event nil))
          (setq one-more-repeat nil)
          (push last-input-event unread-command-events))))))

(provide 'init-dumb-jump)
