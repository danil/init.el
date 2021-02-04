(defgroup init-highlight-symbol nil
  "init-highlight-symbol"
  :group  'editing
  :tag    "init-highlight-symbol"
  :prefix "init-highlight-symbol-"
  :link   '(url-link :tag "GitHub" "https://github.com/danil/init.el"))

(defcustom init-highlight-symbol-mode-lighter " init-highlight-symbol" "init-highlight-symbol" :group 'init-highlight-symbol)

(defcustom init-highlight-symbol-mode-prefix "C-v " "init-highlight-symbol" :group 'init-highlight-symbol)

(defcustom init-highlight-symbol-mode-hooks '()
  "Major modes hooks associated with `highlight-symbol'."
  :group 'init-highlight-symbol)

(defvar init-highlight-symbol-mode-map (make-sparse-keymap) "init-highlight-symbol")

(define-minor-mode init-highlight-symbol-mode "init-highlight-symbol" nil init-highlight-symbol-mode-lighter init-highlight-symbol-mode-map
  (init-highlight-symbol-setup))

(define-globalized-minor-mode init-global-highlight-symbol-mode init-highlight-symbol-mode
  (lambda () (init-highlight-symbol-mode +1)))

(defvar init-highlight-symbol-mode-map (make-sparse-keymap) "init-highlight-symbol")

(defun init-highlight-symbol ()
  (dolist (hook init-highlight-symbol-mode-hooks)
    (add-hook hook 'init-highlight-symbol--setup-hook))

  (if (boundp 'highlight-symbol-mode) (init-highlight-symbol--setup)
    (with-eval-after-load 'highlight-symbol (init-highlight-symbol--setup))))

(defun init-highlight-symbol--setup-hook ()
  "Setup hook `highlight-symbol'."
  (if (fboundp 'highlight-symbol-mode) (init-highlight-symbol--setup-lazy)
    (with-eval-after-load 'highlight-symbol (init-highlight-symbol--setup-lazy))))

(defun init-highlight-symbol--setup-lazy ()
  "Lazy setup `highlight-symbol'."
  (cond ((and (member major-mode '(ruby-mode enh-ruby-mode)) (> (buffer-size) 100000)))
        ((and (member major-mode '(js-mode js2-mode)) (> (buffer-size) 100000)))
        (t (init-lazy init-lazy-seconds nil 'highlight-symbol-mode))))

(defun init-highlight-symbol--setup ()
  "Setup `highlight-symbol'."

  (let ((map init-highlight-symbol-mode-map)
        (prfx init-highlight-symbol-mode-prefix))
    (define-key map (kbd (concat prfx " c S c")) 'highlight-symbol-count)
    (define-key map (kbd (concat prfx " c s")) 'highlight-symbol-query-replace)))

(provide 'init-highlight-symbol)
