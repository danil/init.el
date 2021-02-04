;;; Reuse directory buffer
;;; <http://www.emacswiki.org/emacs/DiredReuseDirectoryBuffer>.

(defun init-dired ()
  (put 'dired-find-alternate-file 'disabled nil)

  (if (boundp 'dired-mode-map) (init-dired--init)
    (with-eval-after-load 'dired (init-dired--init))))

(defun init-dired--init ()
  (define-key dired-mode-map (kbd "^") 'init-dired-reuse-directory-buffer))

(defun init-dired-reuse-directory-buffer ()
  "Reuse `dired' buffer."
  (interactive)

  (let ((d (expand-file-name default-directory)))

    (find-alternate-file "..")
    (when d (dired-goto-file d))))

(provide 'init-dired)
