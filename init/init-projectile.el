(defgroup init-projectile nil
  "init-projectile"
  :group  'editing
  :tag    "init-projectile"
  :prefix "init-projectile-"
  :link   '(url-link :tag "GitHub" "https://github.com/danil/init.el"))

(defcustom init-projectile-mode-lighter " init-projectile" "init-projectile" :group 'init-projectile)

(defcustom init-projectile-mode-prefix "C-c p " "init-projectile" :group 'init-projectile)

(defcustom init-projectile-mode-hooks '()
  "Major modes hook associated with `projectile'."
  :group 'init-projectile)

(defcustom init-projectile-project-root-files '()
  "A list of files considered to mark the root of a project.
The topmost match has precedence.
See `projectile-register-project-type'."
  :group 'init-projectile)

(defvar init-projectile-mode-map (make-sparse-keymap) "init-projectile")

(define-minor-mode init-projectile-mode "init-projectile" nil init-projectile-mode-lighter init-projectile-mode-map
  (init-projectile-setup))

(defun init-projectile-mode-on () "Turn `init-projectile-mode' on." (init-projectile-mode +1))
(defun init-projectile-mode-off () "Turn `init-projectile-mode' off." (init-projectile-mode -1))

(defun init-projectile ()
  (dolist (hook init-projectile-mode-hooks)
    (add-hook hook 'init-projectile-mode-on)))

(defun init-projectile-setup ()
  ;; (counsel-projectile-mode +1)
  (projectile-mode +1)

  (set (make-local-variable 'projectile-project-root-files)
       (append projectile-project-root-files init-projectile-project-root-files))

  (let ((map init-projectile-mode-map)
        (prfx init-projectile-mode-prefix))
    (define-key map (kbd prfx) projectile-command-map)))

(provide 'init-projectile)
