;;; My help
;;; <http://www.gnu.org/software/emacs/manual/html_node/emacs/Help-Summary.html>.
(my-init--hook
  (global-set-key (my-kbd "?") 'help-command)

  (my-init--after-load 'help
    (define-key help-map "f" 'my-describe-function)

    (define-key help-map "?" nil)
    (global-set-key (my-kbd "? ? ?") 'help-for-help)
    (global-set-key (my-kbd "? ? m") 'woman)))

(defun my-describe-function (&optional arg)
  (interactive "P")
  (if arg
      (call-interactively 'describe-function)
    (call-interactively 'find-function)))
