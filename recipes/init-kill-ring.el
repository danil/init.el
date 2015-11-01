(global-set-key (kbd "M-y") 'my-yank-pop)

(defun my-yank-pop (&optional arg)
  (interactive "P")

  (if arg
      (call-interactively 'browse-kill-ring)
    (call-interactively 'kill-ring-ido)))

;; <http://superuser.com/questions/546619/clear-the-kill-ring-in-emacs#546627>.
(defun my-kill-ring-clear ()
  (interactive)
  (progn (setq kill-ring nil) (garbage-collect)))
