(my-init--hook
  (my-init--add-mode-to-patterns 'clojure-mode "/\\.lein-env\\'")

  (my-init--after-load 'clojure-mode
    (define-key clojure-mode-map (my-kbd "C-f") 'clojure-yaless-mode-on)))

(defun clojure-yaless-mode-on (&optional arg)
  (interactive "P")

  (when (and (not arg) (buffer-file-name))
    (call-interactively 'save-buffer)
    ;; (when (fboundp 'cider-load-buffer) (cider-load-buffer))
    )

  (call-interactively 'yaless-mode))

(defun my-clojure-less-minor-mode ()
  (interactive)
  (when (and (or (not (boundp 'less-minor-mode))
                 (not less-minor-mode))
             (buffer-file-name))
    (call-interactively 'save-buffer)
    (cider-load-buffer))
  (call-interactively 'less-minor-mode))
