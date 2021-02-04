(defgroup init-bindings nil
  "init-bindings"
  :group  'editing
  :tag    "init-bindings"
  :prefix "init-bindings-"
  :link   '(url-link :tag "GitHub" "https://github.com/danil/init.el"))

(defcustom init-bindings-mode-lighter " init-bindings" "init-bindings" :group 'init-bindings)

(defvar init-bindings-mode-map (make-sparse-keymap) "init-bindings")

(define-minor-mode init-bindings-mode "init-bindings" nil init-bindings-mode-lighter init-bindings-mode-map
  (init-bindings-setup))

(define-globalized-minor-mode init-global-bindings-mode init-bindings-mode
  (lambda () (init-bindings-mode +1)))

(defun init-bindings-setup ()
  (define-key init-bindings-mode-map (kbd "C-c C-f e") 'end-of-defun))

(provide 'init-bindings)
