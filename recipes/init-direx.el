(my-after-init
  (global-set-key (kbd "C-x d") 'my-dired))

(defun my-dired (&optional arg)
  (interactive "P")
  (if arg (call-interactively 'direx:jump-to-directory)
    (call-interactively 'dired)))