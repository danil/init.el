(defgroup init-fringe nil
  "init-fringe"
  :group  'editing
  :tag    "init-fringe"
  :prefix "init-fringe-"
  :link   '(url-link :tag "GitHub" "https://github.com/danil/init.el"))

(defcustom init-fringe-mode-lighter " init-fringe" "init-fringe" :group 'init-fringe)

(defcustom init-fringe-mode-map-exec-prefix "C-v x " "init-fringe" :group 'init-fringe)

(defvar init-fringe-mode-map (make-sparse-keymap) "init-fringe")

(define-minor-mode init-fringe-mode "init-fringe" nil init-fringe-mode-lighter init-fringe-mode-map
  (init-fringe-setup))

(define-globalized-minor-mode init-global-fringe-mode init-fringe-mode
  (lambda () (init-fringe-mode +1)))

(defun init-fringe-setup ()
  (let ((prfx init-fringe-mode-map-exec-prefix)
        (map init-fringe-mode-map))
    (define-key map (kbd (concat prfx " l")) 'init-fringe-toggle)))

(defun init-fringe-toggle ()
  "Toggle modes in the fringe (left margin of the window).
Toggle the `linume-mode', `diff-hl-mode' and so on."
  (interactive)
  (cond ((or
          (and (boundp 'linum-mode) (equal linum-mode t))
          (and (boundp 'diff-hl-mode) (equal diff-hl-mode t)))
         (when (fboundp 'linum-mode) (linum-mode -1))
         (when (fboundp 'init-diff-hl-setup) (init-diff-hl-setup -1)))
        (t
         (when (fboundp 'linum-mode) (linum-mode t))
         (init-lazy
          init-lazy-seconds nil
          (lambda () (init-diff-hl-setup t))))))

(provide 'init-fringe)
