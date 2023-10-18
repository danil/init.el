(defgroup init-fringe nil
  "init-fringe"
  :group  'editing
  :tag    "init-fringe"
  :prefix "init-fringe-"
  :link   '(url-link :tag "GitHub" "https://github.com/danil/init.el"))

(defcustom init-fringe-mode-lighter " init-fringe" "init-fringe" :group 'init-fringe)

(defcustom init-fringe-mode-map-exec-prefix "C-v x " "init-fringe" :group 'init-fringe)

(defvar init-fringe-mode-map (make-sparse-keymap) "init-fringe")

(define-minor-mode init-fringe-mode "init-fringe" :init-value nil :lighter init-fringe-mode-lighter :keymap init-fringe-mode-map
  (init-fringe-setup))

(define-globalized-minor-mode init-global-fringe-mode init-fringe-mode
  (lambda () (init-fringe-mode +1)))

(defun init-fringe-setup ()
  (let ((prefix init-fringe-mode-map-exec-prefix)
        (map init-fringe-mode-map))
    (define-key map (kbd (concat prefix " l")) 'init-fringe-toggle)))

;; TODO: Change line number width within a C source code file `src/xdisp.c`
;;       by the patch replaces the two lines of code
;;       `  pint2str (lnum_buf, it->lnum_width + 1, lnum_to_display);`
;;       `  strcat (lnum_buf, " ");`
;;       by one line of code
;;       `  pint2str (lnum_buf, it->lnum_width, lnum_to_display);`
;;       <https://emacs.stackexchange.com/questions/52269/how-to-change-line-number-gutter-width-using-display-line-numbers-mode#52271>,
;;       <https://emacs.stackexchange.com/questions/55752/change-line-number-format-with-line-number-mode#55756>.
(defun init-fringe-toggle ()
  "Toggle modes in the fringe (left margin of the window).
Toggle the `display-line-numbers-mode', `diff-hl-mode' and so on."
  (interactive)
  (cond ((or
          (and (boundp 'display-line-numbers-mode) (equal display-line-numbers-mode t))
          (and (boundp 'diff-hl-mode) (equal diff-hl-mode t)))
         (when (fboundp 'display-line-numbers-mode) (display-line-numbers-mode -1))
         (when (fboundp 'init-diff-hl-setup) (init-diff-hl-setup -1)))
        (t
         (when (fboundp 'display-line-numbers-mode) (display-line-numbers-mode t))
         (init-lazy
          init-lazy-seconds nil
          (lambda () (init-diff-hl-setup t))))))

(provide 'init-fringe)
