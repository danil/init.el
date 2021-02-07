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

(defvar init-highlight-symbol-mode-map
  (let ((map (make-sparse-keymap))
        (prfx init-highlight-symbol-mode-prefix))
    (define-key map (kbd (concat prfx " c S c")) 'highlight-symbol-count)
    (define-key map (kbd (concat prfx " c s")) 'highlight-symbol-query-replace)
    map)
  "Keymap for `init-highlight-symbol-mode'.")

(define-minor-mode init-highlight-symbol-mode "init-highlight-symbol" nil init-highlight-symbol-mode-lighter init-highlight-symbol-mode-map
  (init-highlight-symbol-setup))

(defun init-highlight-symbol ()
  (dolist (hook init-highlight-symbol-mode-hooks)
    (add-hook hook 'init-highlight-symbol-lazy-setup)))

(defun init-highlight-symbol-lazy-setup ()
  (init-lazy init-lazy-seconds nil 'init-highlight-symbol-mode +1))

(defun init-highlight-symbol-setup ()
  (cond ((and (member major-mode '(ruby-mode enh-ruby-mode)) (> (buffer-size) 100000)))
        ((and (member major-mode '(js-mode js2-mode)) (> (buffer-size) 100000)))
        ((fboundp 'highlight-symbol-mode) (highlight-symbol-mode +1))))

(provide 'init-highlight-symbol)
