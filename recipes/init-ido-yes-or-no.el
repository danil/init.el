(autoload 'ido-yes-or-no-mode "ido-yes-or-no" nil t)

(add-hook 'after-init-hook 'init-ido-yes-or-no)

(defun init-ido-yes-or-no ()
  "Init."

  (ido-yes-or-no-mode t))
