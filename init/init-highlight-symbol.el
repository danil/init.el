(defgroup init-highlight-symbol nil
  "init-highlight-symbol"
  :group  'editing
  :tag    "init-highlight-symbol"
  :prefix "init-highlight-symbol-"
  :link   '(url-link :tag "GitHub" "https://github.com/danil/init.el"))

(defcustom init-highlight-symbol-mode-lighter " init-highlight-symbol" "init-highlight-symbol" :group 'init-highlight-symbol)

(defcustom init-highlight-symbol-mode-hooks '()
  "Major modes hooks associated with `highlight-symbol'."
  :group 'init-highlight-symbol)

(defcustom init-highlight-symbol-bindings '()
  "Keybindings enabled in `highlight-symbol'. This is not a keymap.
Rather it is an alist that is converted into a keymap just before
`highlight-symbol' is (re-)enabled. The keys are strings or raw key
events and the values are command symbols."
  :group 'init-highlight-symbol
  :type '(alist
          :key-type sexp
          :value-type function))

(defvar init-highlight-symbol-mode-map (make-sparse-keymap)
  "Keymap for `init-highlight-symbol-mode'. Populated when mode is enabled.
See `init-highlight-symbol-bindings'.")

(define-minor-mode init-highlight-symbol-mode "init-highlight-symbol" nil init-highlight-symbol-mode-lighter init-highlight-symbol-mode-map
  (init-highlight-symbol-setup))

(defun init-highlight-symbol ()
  (dolist (hook init-highlight-symbol-mode-hooks)
    (add-hook hook 'init-highlight-symbol-lazy-setup)))

(defun init-highlight-symbol-lazy-setup ()
  (init-lazy init-lazy-seconds nil 'init-highlight-symbol-mode +1))

(defun init-highlight-symbol-setup ()
  (cond ((and (member major-mode '(ruby-mode enh-ruby-mode)) (> (buffer-size) 100000)))
        ((and (member major-mode '(js-mode js2-mode)) (> (buffer-size) 100000)))
        ((fboundp 'highlight-symbol-mode) (init-highlight-symbol--setup))))

(defun init-highlight-symbol--setup ()
  (highlight-symbol-mode +1)

  (dolist (b init-highlight-symbol-bindings)
    (let ((key (car b)) (cmd (cdr b))
          (map init-highlight-symbol-mode-map))
      (define-key map (kbd key) cmd))))

(provide 'init-highlight-symbol)
