(defgroup init-conf-mode nil
  "init-conf-mode"
  :group  'editing
  :tag    "init-conf-mode"
  :prefix "init-conf-mode-"
  :link   '(url-link :tag "GitHub" "https://github.com/danil/init.el"))

(defcustom init-conf-mode-patterns '()
  "Regexp patterns associated with `conf-mode'."
  :group 'init-conf-mode)

(defun init-conf-mode ()
  (dolist (pattern-mode-pair init-conf-mode-patterns)
    (let ((pattern (nth 0 pattern-mode-pair))
          (mode (nth 1 pattern-mode-pair)))
      (add-to-list 'auto-mode-alist (cons pattern mode)))))

(defun init-conf-colon-mode-rainbow-identifiers-setup ()
  (when (equal major-mode 'conf-colon-mode)
    (init-conf-mode--rainbow-identifiers-init)

    (add-hook 'rainbow-identifiers-filter-functions
              'init-conf-colon-mode--rainbow-identifiers-filter)

    (init-rainbow-identifiers--lazy-setup)))

(defun init-conf-space-mode-rainbow-identifiers-setup ()
  (when (equal major-mode 'conf-space-mode)
    (init-conf-mode--rainbow-identifiers-init)
    (init-rainbow-identifiers--lazy-setup)))

(defun init-conf-unix-mode-rainbow-identifiers-setup ()
  (when (equal major-mode 'conf-unix-mode)
    (init-conf-mode--rainbow-identifiers-init)
    (init-rainbow-identifiers--lazy-setup)))

(defun init-conf-xdefaults-mode-rainbow-identifiers-setup ()
  (when (equal major-mode 'conf-xdefaults-mode)
    (init-conf-mode--rainbow-identifiers-init)

    (add-hook 'rainbow-identifiers-filter-functions
              'init-conf-colon-mode--rainbow-identifiers-filter)

    (init-rainbow-identifiers--lazy-setup)))

(defun init-conf-mode--rainbow-identifiers-init ()
  (make-local-variable 'rainbow-identifiers-filter-functions)
  (add-hook 'rainbow-identifiers-filter-functions
            'init-rainbow-identifiers-face-overridable)

  (make-local-variable 'rainbow-identifiers-faces-to-override)
  (setq rainbow-identifiers-faces-to-override '(font-lock-variable-name-face)))

;; <http://amitp.blogspot.ru/2014/09/emacs-rainbow-identifiers-customized.html>.
(defun init-conf-colon-mode--rainbow-identifiers-filter (beg end)
  (let ((str-after (buffer-substring-no-properties end (point-max))))
    (string-match-p "\\`:[[:space:]]*[^[:space:]]+$" str-after)))

(provide 'init-conf-mode)
