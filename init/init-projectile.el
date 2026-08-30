;;; -*- lexical-binding: t; -*-
(defgroup init-projectile nil
  "init-projectile"
  :group  'editing
  :tag    "init-projectile"
  :prefix "init-projectile-"
  :link   '(url-link :tag "GitHub" "https://github.com/danil/init.el"))

(defcustom init-projectile-mode-lighter " init-projectile" "init-projectile" :group 'init-projectile)

(defcustom init-projectile-mode-hooks '()
  "Major modes hook associated with `projectile'."
  :group 'init-projectile)

(defcustom init-projectile-project-root-files '()
  "A list of files considered to mark the root of a project.
The topmost match has precedence.
See `projectile-register-project-type'."
  :group 'init-projectile)

(defvar init-projectile-mode-map (make-sparse-keymap) "init-projectile")

(define-minor-mode init-projectile-mode "init-projectile" :init-value nil :lighter init-projectile-mode-lighter :keymap init-projectile-mode-map
  (init-projectile-setup))

(defun init-projectile-mode-on () (init-projectile-mode +1))
(defun init-projectile-mode-off () (init-projectile-mode -1))

(defun init-projectile ()
  (dolist (hook init-projectile-mode-hooks)
    (add-hook hook 'init-projectile-mode-on)))

(defun init-projectile-setup ()
  ;; (counsel-projectile-mode +1)
  (projectile-mode +1)

  (set (make-local-variable 'projectile-project-root-files)
       (append projectile-project-root-files init-projectile-project-root-files))

  (let ((map init-projectile-mode-map))
    (define-key map (kbd "C-c p ") projectile-command-map))

  ;; Projectile "make" type conflicts with "go" type.
  ;; FIXME: Absence of the "make" type.~~~~<danil@kutkevich.org>
  (setq projectile-project-types
        (cl-delete-if (lambda (type) (equal (car type) 'make)) projectile-project-types))

  (projectile-register-project-type
   'go
   '("go.mod")
   :project-file "go.mod"))

(provide 'init-projectile)
