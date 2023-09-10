;; FIXME: Warning: setting attribute ‘:foreground’ of face ‘mode-line-buffer-id’: nil value is invalid, use ‘unspecified’ instead.~~~~<danil@kutkevich.org>

(defun init-smart-mode-line ()
  (autoload 'sml/setup "smart-mode-line" nil t)
  (sml/setup))

(provide 'init-smart-mode-line)
