(defgroup init-wdired nil
  "init-wdired"
  :group  'editing
  :tag    "init-wdired"
  :prefix "init-wdired-"
  :link   '(url-link :tag "GitHub" "https://github.com/danil/init.el"))

(defcustom init-wdired-map-exec-prefix "C-v x " "init-wdired" :group 'init-wdired)

(defun init-wdired ()
  (if (boundp 'dired-mode-map) (init-wdired--init)
    (with-eval-after-load 'dired (init-wdired--init))))

(defun init-wdired--init ()
  (let ((prfx init-wdired-map-exec-prefix)
        (map dired-mode-map))
    (define-key map (kbd "C-v") nil)
    (define-key map (kbd (concat prfx " w")) 'wdired-change-to-wdired-mode)))

(provide 'init-wdired)
