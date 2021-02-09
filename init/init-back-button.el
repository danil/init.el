(defgroup init-back-button nil
  "init-back-button"
  :group  'editing
  :tag    "init-back-button"
  :prefix "init-back-button-"
  :link   '(url-link :tag "GitHub" "https://github.com/danil/init.el"))

(defcustom init-back-button-lighter " init-back-button" "init-back-button" :group 'init-back-button)

(defcustom init-back-button-mode-bindings '()
  "Keybindings enabled in `init-back-button-mode'. This is not a keymap.
Rather it is an alist that is converted into a keymap just before `init-back-button-mode'
is (re-)enabled. The keys are strings and the values are command symbols."
  :group 'init-back-button
  :type '(alist
          :key-type sexp
          :value-type function))

(defvar init-back-button-mode-map (make-sparse-keymap)
  "Keymap for `init-back-button-mode'. Populated when mode is enabled.
See `init-back-button-mode-bindings'.")

(define-minor-mode init-back-button-mode "init-back-button" nil init-back-button-lighter init-back-button-mode-map
  (init-back-button-mode-setup))

(define-globalized-minor-mode init-global-back-button-mode init-back-button-mode
  (lambda () (init-global-back-button-mode-setup)))

(defun init-global-back-button-mode-on () "Turn `init-global-back-button-mode' on." (init-global-back-button-mode +1))
(defun init-global-back-button-mode-off () "Turn `init-global-back-button-mode' off." (init-global-back-button-mode -1))

(defun init-global-back-button-mode-setup () (back-button-mode +1) (init-back-button-mode +1))
(defun init-global-back-button-mode-teardown () (back-button-mode -1) (init-back-button-mode -1))

(defun init-back-button-mode-setup ()
  (dolist (b init-back-button-mode-bindings)
    (let ((key (car b)) (cmd (cdr b)) (map init-back-button-mode-map))
      (define-key map (kbd key) cmd))))

(provide 'init-back-button)
