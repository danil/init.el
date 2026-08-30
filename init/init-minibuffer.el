;;; -*- lexical-binding: t; -*-
;;; This file is part of Danil Kutkevich <danil@kutkevich.org> home.

(defgroup init-minibuffer nil
  "init-minibuffer"
  :group  'editing
  :tag    "init-minibuffer"
  :prefix "init-minibuffer-"
  :link   '(url-link :tag "GitHub" "https://github.com/danil/init.el"))

(defcustom init-minibuffer-bindings '()
  "Keybindings enabled in `init-minibuffer'. This is not a keymap.
Rather it is an alist that is converted into a keymap just before `init-minibuffer'
is (re-)enabled. The keys are strings and the values are command symbols."
  :group 'init-minibuffer
  :type '(alist
          :key-type sexp
          :value-type function))

(defun init-minibuffer ()
  (if (boundp 'minibuffer-local-map) (init-minibuffer-init)
    (with-eval-after-load 'minibuffer (init-minibuffer-init))))

(defun init-minibuffer-init ()
  (dolist (b init-minibuffer-bindings)
    (let ((key (car b)) (cmd (cdr b)) (map minibuffer-local-map))
      (define-key map (kbd key) cmd))))

(provide 'init-minibuffer)
