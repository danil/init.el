(defgroup init-linenumber nil
  "init-linenumber"
  :group  'editing
  :tag    "init-linenumber"
  :prefix "init-linenumber-"
  :link   '(url-link :tag "GitHub" "https://github.com/danil/init.el"))

(defcustom init-linenumber-lighter " 👁" "init-linenumber" :group 'init-linenumber)

(defcustom init-linenumber-mode-hooks '()
  "Hooks for showing line numbers."
  :group 'init-linenumber)

(defcustom init-linenumber-mode-bindings '()
  "Keybindings enabled in `init-linenumber-mode'. This is not a keymap.
Rather it is an alist that is converted into a keymap just before `init-linenumber-mode'
is (re-)enabled. The keys are strings and the values are command symbols."
  :group 'init-linenumber
  :type '(alist
          :key-type sexp
          :value-type function))

(defvar init-linenumber-mode-map (make-sparse-keymap)
  "Keymap for `init-linenumber-mode'. Populated when mode is enabled.
See `init-linenumber-mode-bindings'.")

;; TODO: Change line number width within a C source code file `src/xdisp.c`
;;       by the patch replaces the two lines of code
;;       `  pint2str (lnum_buf, it->lnum_width + 1, lnum_to_display);`
;;       `  strcat (lnum_buf, " ");`
;;       by one line of code
;;       `  pint2str (lnum_buf, it->lnum_width, lnum_to_display);`
;;       <https://emacs.stackexchange.com/questions/52269/how-to-change-line-number-gutter-width-using-display-line-numbers-mode#52271>,
;;       <https://emacs.stackexchange.com/questions/55752/change-line-number-format-with-line-number-mode#55756>.~~~~<danil@kutkevich.org>

(define-minor-mode init-linenumber-mode "init-linenumber" :init-value nil :lighter init-linenumber-lighter :keymap init-linenumber-mode-map
  (if init-linenumber-mode (init-linenumber-mode-setup) (init-linenumber-mode-teardown)))

(define-globalized-minor-mode init-global-linenumber-mode init-linenumber-mode
  init-global-linenumber-mode-setup
  (unless init-global-linenumber-mode (init-global-linenumber-mode-teardown)))

(defun init-global-linenumber-mode-on ()  (init-global-linenumber-mode +1))
(defun init-global-linenumber-mode-off () (init-global-linenumber-mode -1))

(defun init-global-linenumber-mode-setup ()
  (dolist (hook init-linenumber-mode-hooks)
    (add-hook hook 'lazy-init-linenumber-mode)))

(defun init-global-linenumber-mode-teardown ()
  (dolist (hook init-linenumber-mode-hooks)
    (remove-hook hook 'lazy-init-linenumber-mode))

  (init-linenumber-mode -1))

(defun lazy-init-linenumber-mode ()
  (init-lazy init-lazy-seconds nil (lambda () (init-linenumber-mode +1))))

(defun init-linenumber-mode-setup ()
  (dolist (b init-linenumber-mode-bindings)
    (let ((key (car b)) (cmd (cdr b)) (map init-linenumber-mode-map))
      (define-key map (kbd key) cmd)))

  (init-linenumber-mode--on))

(defun init-linenumber-mode-teardown ()
  (dolist (b init-linenumber-mode-bindings)
    (let ((key (car b)) (map init-linenumber-mode-map))
      (define-key map (kbd key) nil)))

  (init-linenumber-mode--off))

(defun init-linenumber-mode--on ()
  "Turn on the `diff-hl-mode' and so on."
  (interactive)

  (when (fboundp 'display-line-numbers-mode) (display-line-numbers-mode t))
  (when (fboundp 'init-diff-hl-toggle) (init-diff-hl-toggle t))
  (when (fboundp 'init-leerzeichen-space-mode) (init-leerzeichen-space-mode t))
  (when (fboundp 'less-scroll-stub) (less-scroll-stub)))

(defun init-linenumber-mode--off ()
  "Turn off the `diff-hl-mode' and so on."
  (interactive)

  (when (fboundp 'display-line-numbers-mode) (display-line-numbers-mode -1))
  (when (fboundp 'init-diff-hl-toggle) (init-diff-hl-toggle -1))
  (when (fboundp 'init-leerzeichen-space-mode) (init-leerzeichen-space-mode -1)))

(defun init-linenumber-mode-toggle ()
  "Toggle the `diff-hl-mode' and so on."
  (interactive)

  (cond ((or (and (boundp 'display-line-numbers-mode) (equal display-line-numbers-mode t))
             (and (boundp 'diff-hl-mode) (equal diff-hl-mode t))
             (and (boundp 'init-leerzeichen-space-mode) (equal init-leerzeichen-space-mode t)))
         (init-linenumber-mode--off))
        (t
         (init-linenumber-mode--on))))

(provide 'init-linenumber-mode)
