(defun init-dockerfile-mode ()
  (add-to-list 'auto-mode-alist '("/Dockerfile\\'" . dockerfile-mode)))

(defun init-dockerfile-mode-rainbow-identifiers-setup ()
  (when (equal major-mode 'dockerfile-mode)
    (make-local-variable 'rainbow-identifiers-filter-functions)
    (add-hook 'rainbow-identifiers-filter-functions
              'rainbow-identifiers-face-overridable)
    (add-hook 'rainbow-identifiers-filter-functions
              'noxrcp-dockerfile-mode--rainbow-identifiers-filter)
    (make-local-variable 'rainbow-identifiers-faces-to-override)
    (setq rainbow-identifiers-faces-to-override '(
                                                  ;; dockerfile-image-alias
                                                  ;; dockerfile-image-name
                                                  ;; font-lock-keyword-face
                                                  ;; font-lock-variable-name-face
                                                  ))
    (init-rainbow-identifiers--lazy-setup)))

;; <http://amitp.blogspot.ru/2014/09/emacs-rainbow-identifiers-customized.html>.
(defun noxrcp-dockerfile-mode--rainbow-identifiers-filter (beg end)
  "My rainbow-identifiers custom init for symbol between `BEG' and `END'."
  (let ((ch-cur (char-after beg))
        (ch-before (char-before beg))
        (ch-after (char-after end))
        (str-cur (buffer-substring-no-properties beg end))
        (ch80-before (let ((i 80))
                       (if (< (point-min) (- beg i))
                           (buffer-substring-no-properties (- beg i) beg)
                         (buffer-substring-no-properties (point-min) beg))))
        (ch80-after (let ((i 80))
                      (if (> (point-max) (+ end i))
                          (buffer-substring-no-properties end (+ end i))
                        (buffer-substring-no-properties end (point-max)))))
        (str-before (buffer-substring-no-properties (point-min) beg))
        (str-after (buffer-substring-no-properties end (point-max))))
    (not (member ch-cur '(?0 ?1 ?2 ?3 ?4 ?5 ?6 ?7 ?8 ?9 ?? ?_)))))

(provide 'init-dockerfile-mode)
