;;; Inferior Emacs Lisp Mode (REPL).

(add-hook 'after-init-hook 'init-ielm)

(defun init-ielm ()
  "Init."

  (my-init--after-load 'ielm
    ;; (define-key ielm-map "\C-c\C-f" nil)
    (define-key ielm-map "\C-v" nil)))
