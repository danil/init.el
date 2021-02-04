(defgroup init-compile nil
  "init-compile"
  :group  'editing
  :tag    "init-compile"
  :prefix "init-compile-"
  :link   '(url-link :tag "GitHub" "https://github.com/danil/init.el"))

(defcustom init-compile-mode-map-prefix "C-v " "init-compile" :group 'init-compile)

(defcustom init-compile-mode-lighter " init-compile" "init-compile" :group 'init-compile)

(defvar init-compile-mode-map (make-sparse-keymap) "init-compile")

(define-minor-mode init-compile-mode "init-compile" nil init-compile-mode-lighter init-compile-mode-map
  (init-compile-setup))

(define-globalized-minor-mode init-global-compile-mode init-compile-mode
  (lambda () (init-compile-mode +1)))

(defun init-compile ()
  (if (fboundp 'compilation-filter-hook) (init-compile--setup)
    (with-eval-after-load 'compile (init-compile--setup))))

(defun init-compile-setup ()
  (let ((map init-compile-mode-map)
        (prfx init-compile-mode-map-prefix))
    (define-key map (kbd (concat prfx " ! c")) 'compile)))

(defun init-compile--setup ()
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
