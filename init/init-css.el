;;; <http://emacswiki.org/emacs/css-mode.el>.

(defun init-css-mode-rainbow-identifiers-setup ()
  (when (equal major-mode 'css-mode)
    (make-local-variable 'rainbow-identifiers-filter-functions)
    (add-hook 'rainbow-identifiers-filter-functions
              'init-rainbow-identifiers-face-overridable)

    (make-local-variable 'rainbow-identifiers-faces-to-override)
    (setq rainbow-identifiers-faces-to-override '(css-property css-selector))

    (init-rainbow-identifiers--lazy-setup)))

(provide 'init-css)
