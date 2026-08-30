;;; -*- lexical-binding: t; -*-
;;; This file is part of Danil Kutkevich <danil@kutkevich.org> home.

(defgroup init-json-mode nil
  "init-json-mode"
  :group  'editing
  :tag    "init-json-mode"
  :prefix "init-json-mode-"
  :link   '(url-link :tag "GitHub" "https://github.com/danil/init.el"))

(defcustom init-json-mode-lighter " init-json-mode" "init-json-mode" :group 'init-json-mode)

(defvar init-json-mode-map (make-sparse-keymap)
  "Keymap for `init-json-mode'. Populated when mode is enabled.
See `init-json-mode-bindings'.")

(defcustom init-json-mode-bindings '()
  "Keybindings enabled in `init-json-mode'. This is not a keymap.
Rather it is an alist that is converted into a keymap just before `init-json-mode'
is (re-)enabled. The keys are strings and the values are command symbols."
  :group 'init-json-mode
  :type '(alist
          :key-type sexp
          :value-type function))

(define-minor-mode init-json-mode "init-json-mode" :init-value nil :lighter init-json-mode-lighter :keymap init-json-mode-map
  (init-json-mode-setup))

(define-globalized-minor-mode init-global-json-mode init-json-mode
  init-global-json-mode-setup)

(defcustom init-json-mode-patterns '()
  "Regexp patterns associated with `json-mode'."
  :group 'init-json-mode)

(defun init-json-mode-setup ()
  (make-local-variable 'js-indent-level)
  (setq js-indent-level 2))

(defun init-global-json-mode-on () (init-global-json-mode +1))

(defun init-global-json-mode-setup ()
  (dolist (pattern init-json-mode-patterns)
    (add-to-list 'auto-mode-alist (cons pattern 'json-mode))))

(defun init-json-mode-rainbow-identifiers-init ()
  (when (equal major-mode 'json-mode)
    (make-local-variable 'rainbow-identifiers-filter-functions)
    (add-hook 'rainbow-identifiers-filter-functions
              'init-rainbow-identifiers-face-overridable)

    (make-local-variable 'rainbow-identifiers-faces-to-override)
    (setq rainbow-identifiers-faces-to-override '(font-lock-keyword-face))

    (when (<= (count-lines (point-min) (point-max)) 50000) ;number of lines in current buffer
      (init-rainbow-identifiers-lazy-init))))

(provide 'init-json-mode)
