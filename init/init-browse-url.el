(defgroup init-browse-url nil
  "init-browse-url"
  :group  'editing
  :tag    "init-browse-url"
  :prefix "init-browse-url-"
  :link   '(url-link :tag "GitHub" "https://github.com/danil/init.el"))

(defcustom init-browse-url-mode-lighter " init-browse-url" "init-browse-url" :group 'init-browse-url)

(defcustom init-browse-url-mode-map-exec-prefix "C-v x " "init-browse-url" :group 'init-browse-url)

(defvar init-browse-url-mode-map (make-sparse-keymap) "init-browse-url")

(define-minor-mode init-browse-url-mode "init-browse-url" nil init-browse-url-mode-lighter init-browse-url-mode-map
  (init-browse-url-setup))

(define-globalized-minor-mode init-global-browse-url-mode init-browse-url-mode
  (lambda () (init-browse-url-mode +1)))

(defun init-browse-url-setup ()
  (let ((map init-browse-url-mode-map)
        (prfx init-browse-url-mode-map-exec-prefix))
    (define-key map (kbd (concat prfx " u")) 'browse-url-at-point)))

(provide 'init-browse-url)
