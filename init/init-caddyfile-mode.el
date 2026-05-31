(defgroup init-caddyfile-mode nil
  "init-caddyfile-mode"
  :group  'editing
  :tag    "init-caddyfile-mode"
  :prefix "init-caddyfile-mode-"
  :link   '(url-link :tag "GitHub" "https://github.com/danil/init.el"))

(defcustom init-caddyfile-mode-lighter " init-caddyfile-mode" "init-caddyfile-mode" :group 'init-caddyfile-mode)

(defvar init-caddyfile-mode-map (make-sparse-keymap)
  "Keymap for `init-caddyfile-mode'. Populated when mode is enabled.
See `init-caddyfile-mode-bindings'.")

(defcustom init-caddyfile-mode-bindings '()
  "Keybindings enabled in for example `caddyfile-mode'. This is not a keymap.
Rather it is an alist that is converted into a keymap just before `caddyfile-mode'
is (re-)enabled. The keys are strings and the values are command symbols."
  :group 'init-caddyfile-mode
  :type '(alist
          :key-type sexp
          :value-type function))

(define-minor-mode init-caddyfile-mode "init-caddyfile-mode" :init-value nil :lighter init-caddyfile-mode-lighter :keymap init-caddyfile-mode-map
  (init-caddyfile-mode-setup))

(define-globalized-minor-mode init-global-caddyfile-mode init-caddyfile-mode
  init-global-caddyfile-mode-setup
  ;; (unless init-global-caddyfile-mode (init-global-caddyfile-mode-teardown))
  )

(defcustom init-caddyfile-mode-patterns '()
  "Regexp patterns associated with `caddyfile-mode'."
  :group 'init-caddyfile-mode)

(defun init-caddyfile-mode-setup ())

(defun init-global-caddyfile-mode-on () (init-global-caddyfile-mode +1))

(defun init-global-caddyfile-mode-setup ()
  (dolist (pattern init-caddyfile-mode-patterns)
    (add-to-list 'auto-mode-alist (cons pattern 'caddyfile-mode))))

;; (defun init-global-caddyfile-mode-teardown ())

(defun init-caddyfile-mode-rainbow-identifiers-init ()
  (when (equal major-mode 'caddyfile-mode)
    (make-local-variable 'rainbow-identifiers-filter-functions)
    (add-hook 'rainbow-identifiers-filter-functions
              'init-caddyfile-mode-rainbow-identifiers-filter)
    (init-rainbow-identifiers-lazy-init)))

;; <http://amitp.blogspot.ru/2014/09/emacs-rainbow-identifiers-customized.html>.
(defun init-caddyfile-mode-rainbow-identifiers-filter (beg end)
  "My rainbow-identifiers custom init for symbol between `BEG' and `END'."
  (let ((face-cur (or (get-char-property beg 'read-face-name)
                      (get-char-property beg 'face)))
        (ch-cur (char-after beg))
        (str-cur (buffer-substring-no-properties beg end)))
    (and
     (not (member face-cur '('font-lock-string-face 'font-lock-comment-face)))
     (or
      (eq face-cur nil)
      (eq face-cur 'font-lock-type-face)))))

(provide 'init-caddyfile-mode)
