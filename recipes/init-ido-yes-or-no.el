(autoload 'ido-yes-or-no-mode "ido-yes-or-no" nil t)

(add-hook 'after-init-hook 'noxrcp-ido-yes-or-no)

(defun noxrcp-ido-yes-or-no ()
  "My init."

  (ido-yes-or-no-mode t))
