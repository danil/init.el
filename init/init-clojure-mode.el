(defun init-clojure-mode ()
  (add-to-list 'auto-mode-alist '("/\\.lein-env\\'" . clojure-mode)))

(defun init-clojure-mode-rainbow-identifiers-setup ()
  (when (equal major-mode 'clojure-mode)
    (make-local-variable 'rainbow-identifiers-filter-functions)
    (add-hook 'rainbow-identifiers-filter-functions
              'init-clojure-mode-rainbow-identifiers-filter)

    (init-rainbow-identifiers--lazy-setup)))

(defun init-clojure-mode-rainbow-identifiers-filter (beg end)
  "My rainbow-identifiers custom init for symbol between `BEG' and `END'."

  (let ((face-cur (or (get-char-property beg 'read-face-name)
                      (get-char-property beg 'face)))
        (ch-cur (char-after beg))
        (str-cur (buffer-substring-no-properties beg end)))
    (and
     (or
      (eq face-cur nil)
      (eq face-cur 'clojure-keyword-face)
      (eq face-cur 'default)
      (eq face-cur 'font-lock-function-name-face)
      (eq face-cur 'font-lock-type-face))
     (not (member ch-cur
                  '(?% ?* ?+ ?- ?/ ?0 ?1 ?2 ?3 ?4 ?5 ?6 ?7 ?8 ?9 ?< ?< ?= ?> ?? ?_ ?`)))
     ;; (not (member str-cur '(
     ;;                                   )))
     )))

(provide 'init-clojure-mode)
