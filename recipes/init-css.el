;;; <http://emacswiki.org/emacs/css-mode.el>.

(add-hook 'after-init-hook 'myinit-css)

(defun myinit-css ()
  "My init."

  (myinit--after-load 'css-mode
    (setq css-indent-offset 2)))
