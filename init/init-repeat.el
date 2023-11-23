;;; This file is part of Danil Kutkevich <danil@kutkevich.org> home.

(defgroup init-repeat nil
  "init-repeat"
  :group  'editing
  :tag    "init-repeat"
  :prefix "init-repeat-"
  :link   '(url-link :tag "GitHub" "https://github.com/danil/init.el"))

;; <https://emacs.stackexchange.com/questions/14973/how-to-auto-repeat-evil-yank#14993>
(defun init-repeat ()
  (if (boundp 'repeat-map) (init-repeat-init)
    (with-eval-after-load 'repeat (init-repeat-init))))

(defun init-repeat-init ()
  (add-hook 'pre-command-hook 'init-repeat-save-last-repeatable-command))

(defvar init-repeat-last-repeatable-command nil
  "Copy of `last-repeatable-command' that ignores `init-repeat-repeatable-commands-to-ignore'")

(defvar init-repeat-repeatable-commands-to-ignore
  '(init--repeat)
  "List of commands for `init-repeat-last-repeatable-command' to ignore.")

(defun init--repeat (repeat-arg)
  "Modified version of repeat that ignore commands in `init-repeat-repeatable-commands-to-ignore'."
  (interactive "P")

  (when (null repeat-arg)
    (setq repeat-arg last-prefix-arg))

  (let ((last-repeatable-command init-repeat-last-repeatable-command))
    (call-interactively 'repeat t (vector repeat-arg))))

(defun init-repeat-save-last-repeatable-command ()
  "Set to `last-repeatable-command' if value not in `init-repeat-repeatable-commands-to-ignore'."
  (if (not (member last-repeatable-command init-repeat-repeatable-commands-to-ignore))
      (setq init-repeat-last-repeatable-command last-repeatable-command)))

(provide 'init-repeat)
