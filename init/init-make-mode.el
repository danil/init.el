;;; -*- lexical-binding: t; -*-
(defgroup init-make-mode nil
  "init-make-mode"
  :group  'editing
  :tag    "init-make-mode"
  :prefix "init-make-mode-"
  :link   '(url-link :tag "GitHub" "https://github.com/danil/init.el"))

(defcustom init-make-mode-lighter " init-make-mode" "init-make-mode" :group 'init-make-mode)

(defvar init-make-mode-map (make-sparse-keymap)
  "Keymap for `init-make-mode'. Populated when mode is enabled.
See `init-make-mode-bindings'.")

(defcustom init-make-mode-bindings '()
  "Keybindings enabled in for example `makefile-gmake-mode'. This is not a keymap.
Rather it is an alist that is converted into a keymap just before `make-mode'
is (re-)enabled. The keys are strings and the values are command symbols."
  :group 'init-make-mode
  :type '(alist
          :key-type sexp
          :value-type function))

(define-minor-mode init-make-mode "init-make-mode" :init-value nil :lighter init-make-mode-lighter :keymap init-make-mode-map
  (init-make-mode-setup))

(define-globalized-minor-mode init-global-make-mode init-make-mode
  init-global-make-mode-setup
  ;; (unless init-global-make-mode (init-global-make-mode-teardown))
  )

(defcustom init-make-gmake-mode-patterns '()
  "Regexp patterns associated with `gmake-mode-patterns'."
  :group 'init-make-mode)

(defun init-make-mode-setup ())

(defun init-global-make-mode-on () (init-global-make-mode +1))

(defun init-global-make-mode-setup ()
  (dolist (pattern init-make-gmake-mode-patterns)
    (add-to-list 'auto-mode-alist (cons pattern 'makefile-gmake-mode))))

;; (defun init-global-make-mode-teardown ())

(provide 'init-make-mode)
