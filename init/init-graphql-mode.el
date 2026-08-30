;;; -*- lexical-binding: t; -*-
(defgroup init-graphql-mode nil
  "init-graphql-mode"
  :group  'editing
  :tag    "init-graphql-mode"
  :prefix "init-graphql-mode-"
  :link   '(url-link :tag "GitHub" "https://github.com/danil/init.el"))

(defcustom init-graphql-mode-lighter " init-graphql-mode" "init-graphql-mode" :group 'init-graphql-mode)

(defvar init-graphql-mode-map (make-sparse-keymap)
  "Keymap for `init-graphql-mode'. Populated when mode is enabled.
See `init-graphql-mode-bindings'.")

(defcustom init-graphql-mode-bindings '()
  "Keybindings enabled in for example `graphql-mode'. This is not a keymap.
Rather it is an alist that is converted into a keymap just before `graphql-mode'
is (re-)enabled. The keys are strings and the values are command symbols."
  :group 'init-graphql-mode
  :type '(alist
          :key-type sexp
          :value-type function))

(define-minor-mode init-graphql-mode "init-graphql-mode" :init-value nil :lighter init-graphql-mode-lighter :keymap init-graphql-mode-map
  (init-graphql-mode-setup))

(define-globalized-minor-mode init-global-graphql-mode init-graphql-mode
  init-global-graphql-mode-setup
  ;; (unless init-global-graphql-mode (init-global-graphql-mode-teardown))
  )

(defcustom init-graphql-mode-patterns '()
  "Regexp patterns associated with `graphql-mode'."
  :group 'init-graphql-mode)

(defun init-graphql-mode-setup ())

(defun init-global-graphql-mode-on () (init-global-graphql-mode +1))

(defun init-global-graphql-mode-setup ()
  (dolist (pattern init-graphql-mode-patterns)
    (add-to-list 'auto-mode-alist (cons pattern 'graphql-mode))))

;; (defun init-global-graphql-mode-teardown ())

(defun init-graphql-mode-rainbow-identifiers-init ()
  (when (equal major-mode 'graphql-mode)
    (make-local-variable 'rainbow-identifiers-filter-functions)
    (add-hook 'rainbow-identifiers-filter-functions
              'init-graphql-mode-rainbow-identifiers-filter)
    (init-rainbow-identifiers-lazy-init)))

;; <http://amitp.blogspot.ru/2014/09/emacs-rainbow-identifiers-customized.html>.
(defun init-graphql-mode-rainbow-identifiers-filter (beg end)
  "My rainbow-identifiers custom init for symbol between `BEG' and `END'."
  (let ((face-cur (or (get-char-property beg 'read-face-name)
                      (get-char-property beg 'face)))
        (ch-cur (char-after beg))
        (str-cur (buffer-substring-no-properties beg end)))
    (and
     (or
      (eq face-cur nil)
      (eq face-cur 'font-lock-type-face)))))

(provide 'init-graphql-mode)
