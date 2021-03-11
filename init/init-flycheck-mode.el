(defgroup init-flycheck-mode nil
  "init-flycheck-mode"
  :group  'editing
  :tag    "init-flycheck-mode"
  :prefix "init-flycheck-mode-"
  :link   '(url-link :tag "GitHub" "https://github.com/danil/init.el"))

(defcustom init-flycheck-mode-lighter " init-flycheck-mode" "init-flycheck-mode" :group 'init-flycheck-mode)

(define-minor-mode init-flycheck-mode "init-flycheck-mode" nil init-flycheck-mode-lighter nil
  (if init-flycheck-mode (init-flycheck-mode-lazy-setup) (flycheck-mode -1)))

(define-globalized-minor-mode init-global-flycheck-mode init-flycheck-mode
  (lambda () (init-global-flycheck-mode-setup))
  (unless init-global-flycheck-mode (init-global-flycheck-mode-teardown)))

(defun init-global-flycheck-mode-on () (init-global-flycheck-mode +1))

(defun init-global-flycheck-mode-setup ()
  (dolist (hook init-programming-modes-hooks)
    (add-hook hook 'init-flycheck-mode-lazy-setup))

  (when (member major-mode init-programming-modes)
    (init-flycheck-mode-lazy-setup)))

(defun init-global-flycheck-mode-teardown ()
  (dolist (hook init-programming-modes-hooks)
    (remove-hook hook 'init-flycheck-mode-lazy-setup))

  (flycheck-mode -1))

(defun init-flycheck-mode-setup ()
  (flycheck-mode +1)
  (setq flycheck-go-vet-shadow t))

(defun init-flycheck-mode-lazy-setup ()
  (init-lazy init-lazy-seconds nil 'init-flycheck-mode-setup))

(provide 'init-flycheck-mode)
