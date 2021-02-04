(defun init-diff-hl-setup (myarg)
  "Run `diff-hl'."
  (when (and
         (fboundp 'init-diff-hl--setup)
         (fboundp 'diff-hl-mode)
         (fboundp 'diff-hl-margin-mode))
    (diff-hl-margin-mode myarg)
    (diff-hl-mode myarg)
    (init-diff-hl--setup myarg)))

(defun init-diff-hl--setup (myarg)
  "Init/setup or teardown/deinit `diff-hl'."
  (if myarg (init-diff-hl---setup) (init-diff-hl-teardown)))

(defun init-diff-hl---setup ()
  "Init/setup `diff-hl'."
     (add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh)
     ;; (custom-set-faces
     ;;  '(diff-hl-insert ((((class color) (min-colors 88) (background dark)) (:background "magenta" :foreground "magenta")))))
     (when (equal frame-background-mode 'dark)
       ;; (set-face-attribute 'diff-hl-insert nil :inherit 'diff-added
       ;;                     :foreground "green" :background "black")
       (set-face-attribute 'diff-hl-insert nil :inherit 'diff-header) ;diff-added
       ;; (set-face-attribute 'diff-hl-change nil :inherit 'diff-changed
       ;;                     :foreground "brightblue" :background "black")
       (set-face-attribute 'diff-hl-change nil :inherit 'diff-header) ;diff-changed
       ;; (set-face-attribute 'diff-hl-delete nil :inherit 'diff-removed
       ;;                     :foreground "brightred" :background "black")
       (set-face-attribute 'diff-hl-delete nil :inherit 'diff-removed)))

(defun init-diff-hl-teardown ()
  "Teardown/deinit `diff-hl'."
  (remove-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh))
