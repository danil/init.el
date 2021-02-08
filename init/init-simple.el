(defgroup init-simple nil
  "init-simple"
  :group  'editing
  :tag    "init-simple"
  :prefix "init-simple-"
  :link   '(url-link :tag "GitHub" "https://github.com/danil/init.el"))

(defcustom init-simple-mode-lighter " init-simple" "init-simple" :group 'init-simple)

(defcustom init-fundamental-mode-patterns '()
  "Regexp patterns associated with `fundamental-mode'."
  :group 'init-simple-mode)

(defcustom init-simple-bindings '()
  "Keybindings enabled in `init-simple-mode'. This is not a keymap.
Rather it is an alist that is converted into a keymap just before `init-simple-mode'
is (re-)enabled. The keys are strings and the values are command symbols."
  :group 'init-simple
  :type '(alist
          :key-type sexp
          :value-type function))

(defvar init-simple-mode-map (make-sparse-keymap)
  "Keymap for `init-simple-mode'. Populated when mode is enabled.
See `init-simple-bindings'.")

(define-minor-mode init-simple-mode "init-simple" nil init-simple-mode-lighter init-simple-mode-map
  (init-simple-setup))

(define-globalized-minor-mode init-global-simple-mode init-simple-mode
  (lambda () (init-simple-mode +1)))

(defcustom init-simple-yank-pop-function 'init-selectrum-yank-pop ;'counsel-yank-pop
  "No X recipe custom variable for the custom yank pop function."
  :group 'noxinit)

(defun init-simple ()
  ;; (setq line-number-mode t)
  (setq overwrite-mode-textual " OVERWRITING")

  ;; Column number mode <http://gnu.org/software/emacs/manual/html_node/emacs/Optional-Mode-Line.html>.
  (column-number-mode +1)
  ;; Transient mark mode <http://emacswiki.org/TransientMarkMode>.
  (transient-mark-mode +1)

  (dolist (p init-fundamental-mode-patterns)
    (add-to-list 'auto-mode-alist (cons p 'fundamental-mode))))

(defun init-simple-setup ()
  (dolist (b init-simple-bindings)
    (let ((key (car b)) (cmd (cdr b)) (map init-simple-mode-map))
      (define-key map (kbd key) cmd))))

(defun init-simple-yank-pop ()
  (interactive)
  (cond ((equal current-prefix-arg 1) (call-interactively 'yank-pop))
        (current-prefix-arg (call-interactively 'yank-pop))
        (t (if (equal 'yank last-command)
               (call-interactively 'yank-pop)
               (call-interactively init-simple-yank-pop-function)))))

(provide 'init-simple)
