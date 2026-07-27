(defgroup init-cycle-quotes nil
  "init-cycle-quotes"
  :group  'editing
  :tag    "init-cycle-quotes"
  :prefix "init-cycle-quotes-"
  :link   '(url-link :tag "GitHub" "https://github.com/danil/init.el"))

(defcustom init-cycle-quotes-mode-lighter " init-cycle-quotes" "init-cycle-quotes" :group 'init-cycle-quotes)

(defvar init-cycle-quotes-mode-map (make-sparse-keymap) "init-cycle-quotes")

(define-minor-mode init-cycle-quotes-mode "init-cycle-quotes" :init-value nil :lighter init-cycle-quotes-mode-lighter :keymap init-cycle-quotes-mode-map
  (init-cycle-quotes-setup))

(define-globalized-minor-mode init-global-cycle-quotes-mode init-cycle-quotes-mode
  init-global-cycle-quotes-setup
  ;; (unless init-global-cycle-quotes-mode (init-global-cycle-quotes-teardown))
  )

(defun init-cycle-quotes-setup ()
  (let ((map init-cycle-quotes-mode-map))
    (define-key map (kbd "M-x M-x q") 'cycle-quotes) ; FIXME: ????????????????????????????????????????????????????????????????????????????????
    )
  )

(defun init-global-cycle-quotes-setup () (init-cycle-quotes-mode +1))
;; (defun init-global-cycle-quotes-teardown ())

(provide 'init-cycle-quotes)
