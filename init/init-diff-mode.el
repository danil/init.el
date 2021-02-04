(defun init-diff-mode () (add-hook 'diff-mode-hook 'init-diff-mode--setup))

(defun init-diff-mode--setup ()
  (define-key diff-mode-shared-map (kbd "k") nil)

  (when (and (not window-system) (equal frame-background-mode 'dark))
        (set-face-background 'diff-added "black3")
        (set-face-background 'diff-removed "black3")
        (set-face-background 'diff-changed "black3")
        (set-face-background 'diff-file-header "black")
        (set-face-background 'diff-hunk-header "black")))

(provide 'init-diff-mode)
