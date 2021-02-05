(defgroup init-expand-region nil
  "init-expand-region"
  :group  'editing
  :tag    "init-expand-region"
  :prefix "init-expand-region-"
  :link   '(url-link :tag "GitHub" "https://github.com/danil/init.el"))

(defcustom init-expand-region-map-prefix "C-v " "init-expand-region" :group 'init-expand-region)

(defun init-expand-region () (add-hook 'after-init-hook 'init-expand-region-after-init))

(defun init-expand-region-after-init ()
  (setq modes '(er/expand-region
                er/mark-comment
                er/mark-defun
                er/mark-email
                er/mark-inside-pairs
                er/mark-inside-quotes
                er/mark-method-call
                er/mark-next-accessor
                er/mark-outside-pairs
                er/mark-outside-quotes
                er/mark-symbol
                er/mark-symbol-with-prefix
                er/mark-url
                er/mark-word))

  (dolist (m modes) (autoload m "expand-region" nil t))

  (let ((prfx init-expand-region-map-prefix))
    (global-set-key (kbd (concat prfx " e e")) 'er/expand-region)
    (global-set-key (kbd (concat prfx " e c")) 'er/mark-comment)
    (global-set-key (kbd (concat prfx " e d")) 'er/mark-defun)
    (global-set-key (kbd (concat prfx " e m c")) 'er/mark-method-call)
    (global-set-key (kbd (concat prfx " e m m")) 'er/mark-email)
    (global-set-key (kbd (concat prfx " e n")) 'er/mark-next-accessor)
    (global-set-key (kbd (concat prfx " e p i")) 'er/mark-inside-pairs)
    (global-set-key (kbd (concat prfx " e p o")) 'er/mark-outside-pairs)
    (global-set-key (kbd (concat prfx " e q i")) 'er/mark-inside-quotes)
    (global-set-key (kbd (concat prfx " e q o")) 'er/mark-outside-quotes)
    (global-set-key (kbd (concat prfx " e s p")) 'er/mark-symbol-with-prefix)
    (global-set-key (kbd (concat prfx " e s s")) 'er/mark-symbol)
    (global-set-key (kbd (concat prfx " e u")) 'er/mark-url)
    (global-set-key (kbd (concat prfx " e w")) 'er/mark-word)))

(provide 'init-expand-region)
