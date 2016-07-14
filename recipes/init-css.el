;;; <http://emacswiki.org/emacs/css-mode.el>.

(add-hook 'after-init-hook 'init-css)

(defun init-css ()
  "Init."

  (my-init--after-load 'css-mode
    (setq css-indent-offset 2)))
