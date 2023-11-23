;;; This file is part of Danil Kutkevich <danil@kutkevich.org> home.

(defgroup init-evil-repeat nil
  "init-evil-repeat"
  :group  'editing
  :tag    "init-evil-repeat"
  :prefix "init-evil-repeat-"
  :link   '(url-link :tag "GitHub" "https://github.com/danil/init.el"))

;; <https://emacs.stackexchange.com/questions/14973/how-to-auto-repeat-evil-yank#14993>
(defun init-evil-repeat ()
  (if (boundp 'evil-normal-state-map) (init-evil-repeat-init)
    (with-eval-after-load 'evil-repeat (init-evil-repeat-init))))

(defvar init-evil-repeat-last-repeatable-command nil
  "This is the command `init-evil-repeat-init' will try to repeat.")

(defvar init-evil-repeat-next-to-last-repeatable-command nil
  "This is the command `init-evil-repeat-init' tried to repeat.")

(defun init-evil-repeat-init ()
  (evil-define-command init--evil-repeat (count &optional save-point)
    "Repeat the last editing command with count replaced by COUNT.
If SAVE-POINT is non-nil, do not move point."
    :repeat ignore
    :suppress-operator t
    (interactive (list current-prefix-arg
                       (not evil-repeat-move-cursor)))

    (when (not (eq init-evil-repeat-last-repeatable-command last-repeatable-command))
      (setq init-evil-repeat-next-to-last-repeatable-command init-evil-repeat-last-repeatable-command)
      (setq init-evil-repeat-last-repeatable-command last-repeatable-command))

    (when (not (or (eq init-evil-repeat-last-repeatable-command 'repeat)
                   (eq init-evil-repeat-next-to-last-repeatable-command 'repeat)))
      (evil-repeat count save-point))))

(provide 'init-evil-repeat)
