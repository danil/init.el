;;; -*- lexical-binding: t; -*-
;;; This file is part of Danil Kutkevich <danil@kutkevich.org> home.

(defgroup init-zig-mode nil
  "init-zig-mode"
  :group  'editing
  :tag    "init-zig-mode"
  :prefix "init-zig-mode-"
  :link   '(url-link :tag "GitHub" "https://github.com/danil/init.el"))

(defcustom init-zig-mode-lighter " init-zig-mode" "init-zig-mode" :group 'init-zig-mode)

(defvar init-zig-mode-map (make-sparse-keymap)
  "Keymap for `init-zig-mode'. Populated when mode is enabled.
See `init-zig-mode-bindings'.")

(defcustom init-zig-mode-bindings '()
  "Keybindings enabled in `init-zig-mode'. This is not a keymap.
Rather it is an alist that is converted into a keymap just before `init-zig-mode'
is (re-)enabled. The keys are strings and the values are command symbols."
  :group 'init-zig-mode
  :type '(alist
          :key-type sexp
          :value-type function))

(define-minor-mode init-zig-mode "init-zig-mode" :init-value nil :lighter init-zig-mode-lighter :keymap init-zig-mode-map
  (init-zig-mode-setup))

(define-globalized-minor-mode init-global-zig-mode init-zig-mode
  init-global-zig-mode-setup
  ;; (unless init-global-zig-mode (init-global-zig-mode-teardown))
  )

(defcustom init-zig-mode-patterns '()
  "Regexp patterns associated with `zig-mode'."
  :group 'init-zig-mode)

(defun init-zig-mode-setup ())

(defun init-global-zig-mode-on () (init-global-zig-mode +1))

(defun init-global-zig-mode-setup ()
  (dolist (pattern init-zig-mode-patterns)
    (add-to-list 'auto-mode-alist (cons pattern 'zig-mode))))

;; (defun init-global-zig-mode-teardown ())

(defun init-zig-mode-rainbow-identifiers-init ()
  (when (equal major-mode 'zig-mode)
    (make-local-variable 'rainbow-identifiers-filter-functions)
    (add-hook 'rainbow-identifiers-filter-functions
              'init-zig-mode-rainbow-identifiers-filter)
    (init-rainbow-identifiers-lazy-init)))

;; <http://amitp.blogspot.ru/2014/09/emacs-rainbow-identifiers-customized.html>.
(defun init-zig-mode-rainbow-identifiers-filter (beg end)
  "My rainbow-identifiers custom init for symbol between `BEG' and `END'."
  (let ((face-cur (or (get-char-property beg 'read-face-name)
                      (get-char-property beg 'face)))
        (ch-cur (char-after beg))
        (str-cur (buffer-substring-no-properties beg end)))
    (and
     (or
      (eq face-cur nil)
      (eq face-cur 'font-lock-type-face)))))

(provide 'init-zig-mode)
