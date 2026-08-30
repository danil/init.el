;;; -*- lexical-binding: t; -*-
(defgroup init-compile nil
  "init-compile"
  :group  'editing
  :tag    "init-compile"
  :prefix "init-compile-"
  :link   '(url-link :tag "GitHub" "https://github.com/danil/init.el"))

(defcustom init-compile-mode-lighter " init-compile" "init-compile" :group 'init-compile)

(defvar init-compile-mode-map (make-sparse-keymap) "init-compile")

(define-minor-mode init-compile-mode "init-compile" :init-value nil :lighter init-compile-mode-lighter :keymap init-compile-mode-map
  (init-compile-setup))

(define-globalized-minor-mode init-global-compile-mode init-compile-mode
  init-global-compile-setup
  ;; (unless init-global-compile-mode (init-global-compile-teardown))
  )

(defun init-compile ()
  (if (fboundp 'compilation-filter-hook) (init-compile-init)
    (with-eval-after-load 'compile (init-compile-init))))

(defun init-compile-setup ()
  (let ((map init-compile-mode-map))
    (define-key map (kbd "M-x M-x ! c") 'compile) ; FIXME: ????????????????????????????????????????????????????????????????????????????????
    ))

(defun init-global-compile-setup () (init-compile-mode +1))
;; (defun init-global-compile-teardown ())

(defun init-compile-init ()
  (require 'ansi-color)
  (add-hook 'compilation-filter-hook #'init-compile-colorize))

;; ANSI-colors
;; <http://endlessparentheses.com/ansi-colors-in-the-compilation-buffer-output.html>.
(defun init-compile-colorize ()
  "Colorize from `compilation-filter-start' to `point'."
  (let ((inhibit-read-only t))
    (ansi-color-apply-on-region
     compilation-filter-start (point))))

(provide 'init-compile)
