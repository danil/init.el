(global-set-key (my-kbd "v h k") 'git-gutter:revert-hunk)
(global-set-key (my-kbd "v h n") 'my-git-gutter-next-diff)
(global-set-key (my-kbd "v h p") 'my-git-gutter-previous-diff)

(my-init--hook
  ;; (my-init--after-load 'git-gutter
  ;;   (setq git-gutter:disabled-modes '(shell-mode magit-mode)))

  (my-init--add-mode-to-hooks 'git-gutter-mode my-init--programming-modes-hooks))

(add-hook 'git-gutter-mode-on-hook
          (lambda ()
            (setq git-gutter:lighter " gg")
            (dolist (face '(git-gutter:added
                            git-gutter:deleted
                            git-gutter:modified
                            git-gutter:separator
                            git-gutter:unchanged))
              (set-face-background face my-line-numbers-background))))

(defun my-git-gutter-next-diff ()
  (interactive)
  (my-with-repeat-while-press-last-key
    (call-interactively 'git-gutter:next-diff)))

(defun my-git-gutter-previous-diff ()
  (interactive)
  (my-with-repeat-while-press-last-key
    (call-interactively 'git-gutter:previous-diff)))
