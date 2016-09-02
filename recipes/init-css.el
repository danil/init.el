;;; <http://emacswiki.org/emacs/css-mode.el>.

(add-hook 'after-init-hook 'init-css)

(defun init-css ()
  "Init."

  (myinit--after-load 'css-mode
    (setq css-indent-offset 2)))
