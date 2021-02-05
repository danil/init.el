(defgroup init-ferm-mode nil
  "init-ferm-mode"
  :group  'editing
  :tag    "init-ferm-mode"
  :prefix "init-ferm-mode-"
  :link   '(url-link :tag "GitHub" "https://github.com/danil/init.el"))

(defcustom init-ferm-mode-patterns '()
  "Regexp patterns associated with `ferm-mode'."
  :group 'init-ferm-mode)


(defcustom init-ferm-mode-rainbow-identifiers-stop-words '()
  "Do not highlight in `ferm-mode'."
  :group 'init-ferm-mode)

(defun init-ferm-mode ()
  (autoload 'ferm-mode "ferm-mode" nil t)

  (dolist (p init-ferm-mode-patterns)
    (add-to-list 'auto-mode-alist (cons p 'ferm-mode))))

(defun init-ferm-mode-rainbow-identifiers-setup ()
  (when (equal major-mode 'ferm-mode)
    (make-local-variable 'rainbow-identifiers-filter-functions)
    (add-hook 'rainbow-identifiers-filter-functions
              'init-ferm-mode-rainbow-identifiers-filter)
    (init-rainbow-identifiers--lazy-setup)))

;; <http://amitp.blogspot.ru/2014/09/emacs-rainbow-identifiers-customized.html>.
(defun init-ferm-mode-rainbow-identifiers-filter (beg end)
  "My rainbow-identifiers custom init for symbol between `BEG' and `END'."
  (let ((face-cur (or (get-char-property beg 'read-face-name)
                      (get-char-property beg 'face)))
        (ch-cur (char-after beg))
        (str-cur (buffer-substring-no-properties beg end)))
    (and
     (or
      ;; (eq face-cur 'font-lock-preprocessor-face)
      (eq face-cur nil))
     (not (member str-cur init-ferm-mode-rainbow-identifiers-stop-words)))))

(provide 'init-ferm-mode)
