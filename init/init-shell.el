;;; This file is part of Danil Kutkevich <danil@kutkevich.org> home.

(defgroup init-shell nil
  "init-shell"
  :group  'editing
  :tag    "init-shell"
  :prefix "init-shell-"
  :link   '(url-link :tag "GitHub" "https://github.com/danil/init.el"))

(defcustom init-shell-bindings '()
  "Keybindings enabled in `shell-mode'. This is not a keymap.
Rather it is an alist that is converted into a keymap just before `shell-mode'
is (re-)enabled. The keys are strings and the values are command symbols."
  :group 'init-shell
  :type '(alist
          :key-type sexp
          :value-type function))

(defun init-shell ()
  (if (boundp 'shell-mode-map) (init-shell-init)
    (with-eval-after-load 'shell (init-shell-init))))

(defun init-shell-init ()
  (dolist (b init-shell-bindings)
    (let ((key (car b)) (cmd (cdr b)) (map shell-mode-map))
      (define-key map (kbd key) cmd))))

(defun init-shell-clear (&optional arg)
  "Delete output from shell or kill output from shell if `ARG'.
Clear current shell beginning with a-la prompt to `point-min'.
Clearing by `delete-region' or by `kill-region' if `ARG'."
  (interactive "P")
  (goto-char (point-max))
  (search-backward "@")
  (beginning-of-line)
  (if arg
      (kill-region (point-min) (point))
    (delete-region (point-min) (point)))
  (delete-region (point-min) (point))
  (goto-char (point-max)))

(provide 'init-shell)
