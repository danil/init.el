(defgroup init-goto-chg nil
  "init-goto-chg"
  :group  'editing
  :tag    "init-goto-chg"
  :prefix "init-goto-chg-"
  :link   '(url-link :tag "GitHub" "https://github.com/danil/init.el"))

(defcustom init-goto-chg-lighter " init-goto-chg" "init-goto-chg" :group 'init-goto-chg)

(defcustom init-goto-chg-mode-bindings '()
  "Keybindings enabled in `init-goto-chg-mode'. This is not a keymap.
Rather it is an alist that is converted into a keymap just before `init-goto-chg-mode'
is (re-)enabled. The keys are strings and the values are command symbols."
  :group 'init-goto-chg
  :type '(alist
          :key-type sexp
          :value-type function))

(defvar init-goto-chg-mode-map (make-sparse-keymap)
  "Keymap for `init-goto-chg-mode'. Populated when mode is enabled.
See `init-goto-chg-mode-bindings'.")

(define-minor-mode init-goto-chg-mode "init-goto-chg" nil init-goto-chg-lighter init-goto-chg-mode-map
  (init-goto-chg-mode-setup))

(define-globalized-minor-mode init-global-goto-chg-mode init-goto-chg-mode
  (lambda () (init-goto-chg-mode +1)))

(defun init-global-goto-chg-mode-on () "Turn `init-global-goto-chg-mode' on." (init-global-goto-chg-mode +1))
(defun init-global-goto-chg-mode-off () "Turn `init-global-goto-chg-mode' off." (init-global-goto-chg-mode -1))

(defun init-goto-chg-mode-setup ()
  (dolist (b init-goto-chg-mode-bindings)
    (let ((key (car b)) (cmd (cdr b)) (map init-goto-chg-mode-map))
      (define-key map (kbd key) cmd))))

(provide 'init-goto-chg)
