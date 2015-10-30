(my-after-init
  (global-set-key (my-kbd "f s s") 'ag)
  (global-set-key (my-kbd "f s r") 'ag-regexp)
  (global-set-key (my-kbd "f p s") 'ag-dired)
  (global-set-key (my-kbd "f p r") 'ag-dired-regexp)
  (global-set-key (my-kbd "f a k") 'my-ag-kill-buffers)

  (my-eval-after-load 'ag
    ;; (cond ((equal frame-background-mode 'dark)
    ;;        ;; (set-face-background 'ag-match-face "green3")
    ;;        (set-face-foreground 'ag-match-face "lightskyblue1")))
    (setq ag-reuse-window 't)
    (set 'ag-highlight-search t)))

(defun my-ag-kill-buffers (&optional arg)
  (interactive "P")
  (if arg
      (progn (ag-kill-buffers) (message "All ag-mode buffers killed"))
    (ag-kill-other-buffers)
    (message "All ag-mode buffers other than the current buffer killed")))