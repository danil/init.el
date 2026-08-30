;;; -*- lexical-binding: t; -*-
;;; This file is part of Danil Kutkevich <danil@kutkevich.org> home.

;; <http://gnu.org/software/emacs/manual/html_node/emacs/Help-Summary.html>.

(defgroup init-help nil
  "init-help"
  :group  'editing
  :tag    "init-help"
  :prefix "init-help-"
  :link   '(url-link :tag "GitHub" "https://github.com/danil/init.el"))

(defcustom init-help-bindings '()
  "Keybindings enabled in `init-help'. This is not a keymap.
Rather it is an alist that is converted into a keymap just before `init-help'
is (re-)enabled. The keys are strings and the values are command symbols."
  :group 'init-help
  :type '(alist
          :key-type sexp
          :value-type function))

(defun init-help ()
  (if (boundp 'help-map) (init-help-init)
    (with-eval-after-load 'help (init-help-init))))

(defun init-help-init ()
  (dolist (b init-help-bindings)
    (let ((key (car b)) (cmd (cdr b)) (map help-map))
      (define-key map (kbd key) cmd))))

(provide 'init-help)
