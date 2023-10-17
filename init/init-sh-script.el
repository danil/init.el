;;; This file is part of Danil Kutkevich <danil@kutkevich.org> home.

(defgroup init-sh-mode nil
  "init-sh-mode"
  :group  'editing
  :tag    "init-sh-mode"
  :prefix "init-sh-mode-"
  :link   '(url-link :tag "GitHub" "https://github.com/danil/init.el"))

(defcustom init-sh-mode-lighter " init-sh-mode" "init-sh-mode" :group 'init-sh-mode)

(defvar init-sh-mode-map (make-sparse-keymap)
  "Keymap for `init-sh-mode'. Populated when mode is enabled.
See `init-sh-map-bindings'.")

(defcustom init-sh-map-bindings '()
  "Keybindings enabled in `init-sh-mode'. This is not a keymap.
Rather it is an alist that is converted into a keymap just before `init-sh-mode'
is (re-)enabled. The keys are strings and the values are command symbols."
  :group 'init-sh-mode
  :type '(alist
          :key-type sexp
          :value-type function))

(define-minor-mode init-sh-mode "init-sh-mode" :init-value nil :lighter init-sh-mode-lighter :keymap init-sh-mode-map
  (init-sh-mode-setup))

(define-globalized-minor-mode init-global-sh-mode init-sh-mode
  (lambda () (init-global-sh-mode-setup) )
  (unless init-global-sh-mode (init-global-sh-mode-teardown)))

(defcustom init-sh-mode-patterns '()
  "Regexp patterns associated with `sh-mode'."
  :group 'init-sh-mode)

(defun init-sh-mode-setup ())

(defun init-global-sh-mode-on () (init-global-sh-mode +1))

(defun init-global-sh-mode-setup ()
  (dolist (pattern init-sh-mode-patterns)
    (add-to-list 'auto-mode-alist (cons pattern 'sh-mode))))

(defun init-global-sh-mode-teardown ())

(defun init-sh-mode-rainbow-identifiers-setup ()
  (when (equal major-mode 'sh-mode)
    (make-local-variable 'rainbow-identifiers-filter-functions)
    (add-hook 'rainbow-identifiers-filter-functions
              'rainbow-identifiers-face-overridable)
    (add-hook 'rainbow-identifiers-filter-functions
              'init-sh-mode-rainbow-identifiers-filter)

    (make-local-variable 'rainbow-identifiers-faces-to-override)
    (setq rainbow-identifiers-faces-to-override '(
                                                  font-lock-string-face
                                                  font-lock-variable-name-face
                                                  sh-heredoc
                                                  sh-quoted-exec
                                                  ))

    (init-rainbow-identifiers--lazy-setup)))

;; <http://amitp.blogspot.ru/2014/09/emacs-rainbow-identifiers-customized.html>.
(defun init-sh-mode-rainbow-identifiers-filter (beg end)
  "My rainbow-identifiers custom init for symbol between `BEG' and `END'."

  (let ((ch-after (char-after end))
        (ch-before (char-before beg))
        (str-cur (buffer-substring-no-properties beg end))
        (str-2char-before (buffer-substring-no-properties
                     (max (point-min) (- beg 2)) beg))
        (str-after (buffer-substring-no-properties end (point-max))))
    (and
     (string-match-p "\\`[a-zA-Z_\x7f-\xff][a-zA-Z0-9_\x7f-\xff]*\\'"
                     str-cur)
     (or (and
          (member str-2char-before '(?$ "${"))
          ;; (string-match-p "\\`[^}]*}" str-after)
          (equal ch-after ?}))
         (equal ch-before ?$)
         (string-match-p "\\`[[:space:]]*[/*+-]?=" str-after)))))

(provide 'init-sh-mode)
