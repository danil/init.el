;;; This file is part of Danil Kutkevich <danil@kutkevich.org> home.

(defgroup init-wdired nil
  "init-wdired"
  :group  'editing
  :tag    "init-wdired"
  :prefix "init-wdired-"
  :link   '(url-link :tag "GitHub" "https://github.com/danil/init.el"))

(defcustom init-wdired-bindings '()
  "Keybindings enabled in `init-wdired-mode'. This is not a keymap.
Rather it is an alist that is converted into a keymap just before `init-wdired-mode'
is (re-)enabled. The keys are strings and the values are command symbols."
  :group 'init-wdired
  :type '(alist
          :key-type sexp
          :value-type function))

(defun init-wdired ()
  (if (boundp 'dired-mode-map) (init-wdired--init)
    (with-eval-after-load 'dired (init-wdired--init))))

(defun init-wdired--init ()
  (dolist (b init-wdired-bindings)
    (let ((key (car b)) (cmd (cdr b)) (map dired-mode-map))
      (define-key map (kbd key) cmd))))

(provide 'init-wdired)
