(defgroup init-cycle-quotes nil
  "init-cycle-quotes"
  :group  'editing
  :tag    "init-cycle-quotes"
  :prefix "init-cycle-quotes-"
  :link   '(url-link :tag "GitHub" "https://github.com/danil/init.el"))

(defcustom init-cycle-quotes-mode-map-prefix "C-v " "init-cycle-quotes" :group 'init-cycle-quotes)

(defcustom init-cycle-quotes-mode-lighter " init-cycle-quotes" "init-cycle-quotes" :group 'init-cycle-quotes)

(defvar init-cycle-quotes-mode-map (make-sparse-keymap) "init-cycle-quotes")

(define-minor-mode init-cycle-quotes-mode "init-cycle-quotes" nil init-cycle-quotes-mode-lighter init-cycle-quotes-mode-map
  (init-cycle-quotes-setup))

(define-globalized-minor-mode init-global-cycle-quotes-mode init-cycle-quotes-mode
  (lambda () (init-cycle-quotes-mode +1)))

(defun init-cycle-quotes-setup ()
  (let ((map init-cycle-quotes-mode-map)
        (prfx init-cycle-quotes-mode-map-prefix))
    (define-key map (kbd (concat prfx " q")) 'cycle-quotes)))

(provide 'init-cycle-quotes)
