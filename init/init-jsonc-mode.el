;;; This file is part of Danil Kutkevich <danil@kutkevich.org> home.

(defgroup init-jsonc-mode nil
  "init-jsonc-mode"
  :group  'editing
  :tag    "init-jsonc-mode"
  :prefix "init-jsonc-mode-"
  :link   '(url-link :tag "GitHub" "https://github.com/danil/init.el"))

(defcustom init-jsonc-mode-lighter " init-jsonc-mode" "init-jsonc-mode" :group 'init-jsonc-mode)

(defvar init-jsonc-mode-map (make-sparse-keymap)
  "Keymap for `init-jsonc-mode'. Populated when mode is enabled.
See `init-jsonc-mode-bindings'.")

(defcustom init-jsonc-mode-bindings '()
  "Keybindings enabled in `init-jsonc-mode'. This is not a keymap.
Rather it is an alist that is converted into a keymap just before `init-jsonc-mode'
is (re-)enabled. The keys are strings and the values are command symbols."
  :group 'init-jsonc-mode
  :type '(alist
          :key-type sexp
          :value-type function))

(define-minor-mode init-jsonc-mode "init-jsonc-mode" :init-value nil :lighter init-jsonc-mode-lighter :keymap init-jsonc-mode-map
  (init-jsonc-mode-setup))

(define-globalized-minor-mode init-global-jsonc-mode init-jsonc-mode
  init-global-jsonc-mode-setup)

(defcustom init-jsonc-mode-patterns '()
  "Regexp patterns associated with `jsonc-mode'."
  :group 'init-jsonc-mode)

(defun init-jsonc-mode-setup ())

(defun init-global-jsonc-mode-on () (init-global-jsonc-mode +1))

(defun init-global-jsonc-mode-setup ()
  (dolist (pattern init-jsonc-mode-patterns)
    (add-to-list 'auto-mode-alist (cons pattern 'jsonc-mode))))

(defun init-jsonc-mode-rainbow-identifiers-init ()
  (when (equal major-mode 'jsonc-mode)
    (make-local-variable 'rainbow-identifiers-filter-functions)
    (add-hook 'rainbow-identifiers-filter-functions
              'init-rainbow-identifiers-face-overridable)

    (make-local-variable 'rainbow-identifiers-faces-to-override)
    (setq rainbow-identifiers-faces-to-override '(font-lock-keyword-face))

    (when (<= (count-lines (point-min) (point-max)) 50000) ;number of lines in current buffer
      (init-rainbow-identifiers-lazy-init))))

(provide 'init-jsonc-mode)
