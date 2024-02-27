(defgroup init-overview-mode nil
  "init-overview-mode"
  :group  'editing
  :tag    "init-overview-mode"
  :prefix "init-overview-mode-"
  :link   '(url-link :tag "GitHub" "https://github.com/danil/init.el"))

;; (defcustom init-overview-mode-lighter " 👁" "init-overview-mode" :group 'init-overview-mode) ; 👁

;; (defcustom init-overview-mode-hooks '()
;;   "Hooks to display line numbers."
;;   :group 'init-overview-mode)

;; (defcustom init-overview-mode-bindings '()
;;   "Keybindings enabled in `init-overview-mode'. This is not a keymap.
;; Rather it is an alist that is converted into a keymap just before `init-overview-mode'
;; is (re-)enabled. The keys are strings and the values are command symbols."
;;   :group 'init-overview-mode
;;   :type '(alist
;;           :key-type sexp
;;           :value-type function))

;; (defvar init-overview-mode-map (make-sparse-keymap)
;;   "Keymap for `init-overview-mode'. Populated when mode is enabled.
;; See `init-overview-mode-bindings'.")

;; (define-globalized-minor-mode init-global-overview-mode init-overview-mode
;;   init-global-overview-mode-setup
;;   (unless init-global-overview-mode (init-global-overview-mode-teardown)))

;; (defun init-global-overview-mode-on ()  (interactive) (init-global-overview-mode +1))
;; (defun init-global-overview-mode-off () (interactive) (init-global-overview-mode -1))

;; (defun init-global-overview-mode-setup ()
;;   (dolist (hook init-overview-mode-hooks)
;;     (add-hook hook 'init-global-overview-mode-lazy-setup)))

;; (defun init-global-overview-mode-lazy-setup ()
;;   (init-lazy init-lazy-seconds nil 'init-overview-mode-on))

;; (defun init-global-overview-mode-teardown ()
;;   (dolist (hook init-overview-mode-hooks)
;;     (remove-hook hook 'init-global-overview-mode-lazy-setup)))

;; (define-minor-mode init-overview-mode "init-overview-mode" :init-value nil :lighter init-overview-mode-lighter :keymap init-overview-mode-map
;;   (if init-overview-mode (init-overview-mode-setup) (init-overview-mode-teardown)))

;; (defun init-overview-mode-on ()  (interactive) (init-overview-mode +1))
;; (defun init-overview-mode-off () (interactive) (init-overview-mode -1))

;; (defun init-overview-mode-setup ()
;;   (dolist (b init-overview-mode-bindings)
;;     (let ((key (car b)) (cmd (cdr b)) (map init-overview-mode-map))
;;       (define-key map (kbd key) cmd)))

;;   (init-overview-mode--setup))

;; (defun init-overview-mode-teardown ()
;;   (dolist (b init-overview-mode-bindings)
;;     (let ((key (car b)) (map init-overview-mode-map))
;;       (define-key map (kbd key) nil)))

;;   (init-overview-mode--teardown))

(defun init-overview-mode--setup ()
  "Turn on the `display-line-numbers-mode' and so on."
  (interactive)

  (when (fboundp 'init-display-line-numbers-mode-on) (init-display-line-numbers-mode-on))
  (when (fboundp 'init-diff-hl-toggle) (init-diff-hl-toggle t))
  (when (fboundp 'init-leerzeichen-mode-on) (init-leerzeichen-mode-on))
  (when (fboundp 'global-highlight-thing-mode) (global-highlight-thing-mode t)))

(defun init-overview-mode--teardown ()
  "Turn off the `display-line-numbers-mode' and so on."
  (interactive)

  (when (fboundp 'init-display-line-numbers-mode-off) (init-display-line-numbers-mode-off))
  (when (fboundp 'init-diff-hl-toggle) (init-diff-hl-toggle -1))
  (when (fboundp 'init-leerzeichen-mode-off) (init-leerzeichen-mode-off))
  (when (fboundp 'global-highlight-thing-mode) (global-highlight-thing-mode -1)))

(defun init-overview-mode-toggle ()
  "Toggle the `display-line-numbers-mode' and so on."
  (interactive)

  (cond ((or (and (boundp 'init-display-line-numbers-mode) (equal init-display-line-numbers-mode t))
             (and (boundp 'diff-hl-mode) (equal diff-hl-mode t))
             (and (boundp 'init-leerzeichen-mode) (equal init-leerzeichen-mode t))
             (and (boundp 'global-highlight-thing-mode) (equal global-highlight-thing-mode t)))
         (init-overview-mode--teardown))
        (t
         (init-overview-mode--setup))))

(provide 'init-overview-mode)
