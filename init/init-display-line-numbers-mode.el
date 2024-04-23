(defgroup init-display-line-numbers-mode nil
  "init-display-line-numbers-mode"
  :group  'editing
  :tag    "init-display-line-numbers-mode"
  :prefix "init-display-line-numbers-mode-"
  :link   '(url-link :tag "GitHub" "https://github.com/danil/init.el"))

(defcustom init-display-line-numbers-mode-lighter "" "init-display-line-numbers-mode" :group 'init-display-line-numbers-mode)

(defcustom init-display-line-numbers-mode-hooks '()
  "Hooks to display whitespace characters."
  :group 'init-display-line-numbers-mode)

;; TODO: Change line number width within a C source code file `src/xdisp.c`
;;       by the patch replaces the two lines of code
;;       `  pint2str (lnum_buf, it->lnum_width + 1, lnum_to_display);`
;;       `  strcat (lnum_buf, " ");`
;;       by one line of code
;;       `  pint2str (lnum_buf, it->lnum_width, lnum_to_display);`
;;       <https://emacs.stackexchange.com/questions/52269/how-to-change-line-number-gutter-width-using-display-line-numbers-mode#52271>,
;;       <https://emacs.stackexchange.com/questions/55752/change-line-number-format-with-line-number-mode#55756>.~~~~<danil@kutkevich.org>

(define-globalized-minor-mode init-global-display-line-numbers-mode init-display-line-numbers-mode
  init-global-display-line-numbers-mode-setup
  (unless init-global-display-line-numbers-mode (init-global-display-line-numbers-mode-teardown)))

(defun init-global-display-line-numbers-mode-on ()  (interactive) (init-global-display-line-numbers-mode +1))
(defun init-global-display-line-numbers-mode-off () (interactive) (init-global-display-line-numbers-mode -1))

(defun init-global-display-line-numbers-mode-setup ()
  (dolist (hook init-display-line-numbers-mode-hooks)
    (add-hook hook 'init-display-line-numbers-mode-on)))

(defun init-global-display-line-numbers-mode-teardown ()
  (dolist (hook init-display-line-numbers-mode-hooks)
    (remove-hook hook 'init-display-line-numbers-mode-on)))

(define-minor-mode init-display-line-numbers-mode "init-display-line-numbers-mode" :init-value nil :lighter init-display-line-numbers-mode-lighter
  (if init-display-line-numbers-mode (init-display-line-numbers-mode-setup) (init-display-line-numbers-mode-teardown)))

(defun init-display-line-numbers-mode-setup ()
  (when (fboundp 'xterm-mouse-mode) (xterm-mouse-mode t))
  (when (fboundp 'display-line-numbers-mode) (display-line-numbers-mode t)))

(defun init-display-line-numbers-mode-teardown ()
  (when (fboundp 'xterm-mouse-mode) (xterm-mouse-mode -1))
  (when (fboundp 'display-line-numbers-mode) (display-line-numbers-mode -1)))

(defun init-display-line-numbers-mode-on ()  (interactive) (init-display-line-numbers-mode +1))
(defun init-display-line-numbers-mode-off () (interactive) (init-display-line-numbers-mode -1))

(provide 'init-display-line-numbers-mode)
