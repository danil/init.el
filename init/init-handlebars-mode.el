;;; This file is part of Danil Kutkevich <danil@kutkevich.org> home.

(defgroup init-handlebars-mode nil
  "init-handlebars-mode"
  :group  'editing
  :tag    "init-handlebars-mode"
  :prefix "init-handlebars-mode-"
  :link   '(url-link :tag "GitHub" "https://github.com/danil/init.el"))

(defcustom init-handlebars-mode-lighter " init-handlebars-mode" "init-handlebars-mode" :group 'init-handlebars-mode)

(defvar init-handlebars-mode-map (make-sparse-keymap)
  "Keymap for `init-handlebars-mode'. Populated when mode is enabled.
See `init-handlebars-map-bindings'.")

(defcustom init-handlebars-map-bindings '()
  "Keybindings enabled in for example `handlebarsfile-ghandlebars-mode'. This is not a keymap.
Rather it is an alist that is converted into a keymap just before `highlight-symbol'
is (re-)enabled. The keys are strings and the values are command symbols."
  :group 'init-handlebars-mode
  :type '(alist
          :key-type sexp
          :value-type function))

(define-minor-mode init-handlebars-mode "init-handlebars-mode" :init-value nil :lighter init-handlebars-mode-lighter :keymap init-handlebars-mode-map
  (init-handlebars-mode-setup))

(define-globalized-minor-mode init-global-handlebars-mode init-handlebars-mode
  (lambda () (init-global-handlebars-mode-setup) )
  (unless init-global-handlebars-mode (init-global-handlebars-mode-teardown)))

(defcustom init-handlebars-mode-patterns '()
  "Regexp patterns associated with `handlebars-mode'."
  :group 'init-handlebars-mode)

(defun init-handlebars-mode-setup ())

(defun init-global-handlebars-mode-on () (init-global-handlebars-mode +1))

(defun init-global-handlebars-mode-setup ()
  (dolist (pattern init-handlebars-mode-patterns)
    (add-to-list 'auto-mode-alist (cons pattern 'handlebars-mode))))

(defun init-global-handlebars-mode-teardown ())

(defun init-handlebars-mode-rainbow-identifiers-setup ()
  (when (equal major-mode 'handlebars-mode)
    (make-local-variable 'rainbow-identifiers-filter-functions)
    (add-hook 'rainbow-identifiers-filter-functions
              'init-handlebars-mode-rainbow-identifiers-filter)
    (init-rainbow-identifiers--lazy-setup)))

;; <http://amitp.blogspot.ru/2014/09/emacs-rainbow-identifiers-customized.html>.
(defun init-handlebars-mode-rainbow-identifiers-filter (beg end)
  "My rainbow-identifiers custom init for symbol between `BEG' and `END'."
  (let ((face-cur (or (get-char-property beg 'read-face-name)
                      (get-char-property beg 'face)))
        (ch-cur (char-after beg))
        (str-cur (buffer-substring-no-properties beg end)))
    (and
     (or
      ;; (eq face-cur nil)
      (eq face-cur 'font-lock-variable-name-face)))))

(provide 'init-handlebars-mode)
