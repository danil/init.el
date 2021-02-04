;;; Corral is an Smartparens replacement
;;; (quotes/parentheses/delimiters manager).

(defgroup init-corral nil
  "init-corral"
  :group  'editing
  :tag    "init-corral"
  :prefix "init-corral-"
  :link   '(url-link :tag "GitHub" "https://github.com/danil/init.el"))

(defcustom init-corral-mode-map-prefix "C-v " "init-corral" :group 'init-corral)

(defcustom init-corral-mode-lighter " init-corral" "init-corral" :group 'init-corral)

(defvar init-corral-mode-map (make-sparse-keymap) "init-corral")

(define-minor-mode init-corral-mode "init-corral" nil init-corral-mode-lighter init-corral-mode-map
  (init-corral-setup))

(define-globalized-minor-mode init-global-corral-mode init-corral-mode
  (lambda () (init-corral-mode +1)))

(defun init-corral-setup ()
  (let ((map init-corral-mode-map)
        (prfx init-corral-mode-map-prefix))
    (define-key map (kbd (concat prfx " d (")) 'corral-parentheses-backward)
    (define-key map (kbd (concat prfx " d )")) 'corral-parentheses-forward)

    (define-key map (kbd (concat prfx " d [")) 'corral-brackets-backward)
    (define-key map (kbd (concat prfx " d ]")) 'corral-brackets-forward)

    (define-key map (kbd (concat prfx " d {")) 'corral-braces-backward)
    (define-key map (kbd (concat prfx " d }")) 'corral-braces-forward)

    (define-key map (kbd (concat prfx " d \" b")) 'corral-double-quotes-backward)
    (define-key map (kbd (concat prfx " d \" f")) 'corral-double-quotes-forward)

    (define-key map (kbd (concat prfx " d ' b")) 'corral-single-quotes-backward)
    (define-key map (kbd (concat prfx " d ' f")) 'corral-single-quotes-forward)))

(provide 'init-corral)
