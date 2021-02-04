(defgroup init-anzu nil
  "init-anzu"
  :group  'editing
  :tag    "init-anzu"
  :prefix "init-anzu-"
  :link   '(url-link :tag "GitHub" "https://github.com/danil/init.el"))

(defcustom init-anzu-mode-lighter " init-anzu" "init-anzu" :group 'init-anzu)

(defcustom init-anzu-mode-map-exec-prefix "C-v " "init-anzu" :group 'init-anzu)

(defvar init-anzu-mode-map (make-sparse-keymap) "init-anzu")

(define-minor-mode init-anzu-mode "init-anzu" nil init-anzu-mode-lighter init-anzu-mode-map
  (init-anzu-setup))

(define-globalized-minor-mode init-global-anzu-mode init-anzu-mode
  (lambda () (init-anzu-mode +1)))

(defun init-anzu ()
  (if (boundp 'global-anzu-mode) (init-anzu--init)
    (with-eval-after-load 'anzu (init-anzu--init))))

(defun init-anzu-setup ()
  (define-key init-anzu-mode-map (kbd "M-%") 'anzu-query-replace)
  (define-key init-anzu-mode-map (kbd "C-M-%") 'anzu-query-replace-regexp))

(defun init-anzu--init () (global-anzu-mode +1))

(provide 'init-anzu)
