(defgroup init-deft nil
  "init-deft"
  :group  'editing
  :tag    "init-deft"
  :prefix "init-deft-"
  :link   '(url-link :tag "GitHub" "https://github.com/danil/init.el"))

(defcustom init-deft-mode-map-exec-prefix "C-v x " "init-deft" :group 'init-deft)

(defcustom init-deft-mode-lighter " init-deft" "init-deft" :group 'init-deft)

(defvar init-deft-mode-map (make-sparse-keymap) "init-deft")

(define-minor-mode init-deft-mode "init-deft" nil init-deft-mode-lighter init-deft-mode-map
  (init-deft-setup))

(define-globalized-minor-mode init-global-deft-mode init-deft-mode
  (lambda () (init-deft-mode +1)))

(defun init-deft-setup ()
  (let ((map init-deft-mode-map)
        (prfx init-deft-mode-map-exec-prefix))
    (define-key map (kbd (concat prfx " d")) 'init-deft-setup-run)))

(defun init-deft-setup-run (&optional arg)
  "Open `deft' list or create `deft' item if `ARG'."
  (interactive "P")
  (if arg (deft-new-file) (deft)))

(provide 'init-deft)
