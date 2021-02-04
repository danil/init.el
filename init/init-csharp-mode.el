(defun init-csharp-mode-rainbow-identifiers-setup ()
  (when (equal major-mode 'csharp-mode)
    (make-local-variable 'rainbow-identifiers-filter-functions)
    (add-hook 'rainbow-identifiers-filter-functions
              'rainbow-identifiers-face-overridable)
    (add-hook 'rainbow-identifiers-filter-functions
              'init-csharp-mode-rainbow-identifiers-filter)

    (make-local-variable 'rainbow-identifiers-faces-to-override)
    (setq rainbow-identifiers-faces-to-override
          '(font-lock-variable-name-face font-lock-function-name-face))

    (init-rainbow-identifiers--lazy-setup)))

;; <http://amitp.blogspot.ru/2014/09/emacs-rainbow-identifiers-customized.html>.
(defun init-csharp-mode-rainbow-identifiers-filter (beg end)
  "My rainbow-identifiers custom init for symbol between `BEG' and `END'."

  (let ((ch-cur (char-after beg))
        (ch-before (char-before beg))
        (ch-after (char-after end))
        (str-cur (buffer-substring-no-properties beg end))
        (str-before (buffer-substring-no-properties (point-min) beg))
        (str-after (buffer-substring-no-properties end (point-max))))
    (and (not (member ch-cur
                      '(?0 ?1 ?2 ?3 ?4 ?5 ?6 ?7 ?8 ?9 ??)))
         (not (or (equal ch-before ?\<) (equal ch-after ?\<)))
         (or (not (and (equal ch-before ?\.) (equal ch-after ?\.)))
             (string-match-p "\\`\\.[[:space:]\n]*\\(new\\)[^a-zA-Z0-1]"
                             str-after)))))

(provide 'init-csharp-mode)
