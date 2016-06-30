;;; Inferior Emacs Lisp Mode (REPL).

(my-init--hook
  (my-init--after-load 'ielm
    ;; (define-key ielm-map "\C-c\C-f" nil)
    (define-key ielm-map "\C-v" nil)))
