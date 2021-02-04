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

(defvar init-projectile-mode-map (make-sparse-keymap) "init-projectile")

(defun init-projectile ()
  (dolist (hook init-projectile-mode-hooks)
    (add-hook hook 'init-projectile--lazy-setup-hook)))

(defun init-projectile-setup ()
  (projectile-mode +1)
  ;; (counsel-projectile-mode +1)

  (set (make-local-variable 'projectile-project-root-files)
       (append projectile-project-root-files init-projectile-project-root-files))

  (let ((map init-projectile-mode-map)
        (prfx init-projectile-mode-prefix))
    (define-key map (kbd prfx) projectile-command-map)))

(defun init-projectile--lazy-setup-hook ()
  "Lazy setup `projectile'."
  (init-lazy init-lazy-seconds nil 'init-projectile-mode +1))

(provide 'init-projectile)
