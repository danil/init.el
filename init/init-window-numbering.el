(defgroup init-window-numbering nil
  "init-window-numbering"
  :group  'editing
  :tag    "init-window-numbering"
  :prefix "init-window-numbering-"
  :link   '(url-link :tag "GitHub" "https://github.com/danil/init.el"))

(defcustom init-window-numbering-mode-map-prefix "C-v " "init-window-numbering" :group 'init-window-numbering)

(defun init-window-numbering ()
  (autoload 'window-numbering-keymap "window-numbering"
    "Numbered window shortcuts" t)

  (if (boundp 'window-numbering-keymap) (init-window-numbering--init)
    (with-eval-after-load 'window-numbering (init-window-numbering--init)))

  (window-numbering-mode))

(defun init-window-numbering--init ()
  (define-key window-numbering-keymap "\M-0" nil)
  (define-key window-numbering-keymap "\M-1" nil)
  (define-key window-numbering-keymap "\M-2" nil)
  (define-key window-numbering-keymap "\M-3" nil)
  (define-key window-numbering-keymap "\M-4" nil)
  (define-key window-numbering-keymap "\M-5" nil)
  (define-key window-numbering-keymap "\M-6" nil)
  (define-key window-numbering-keymap "\M-7" nil)
  (define-key window-numbering-keymap "\M-8" nil)
  (define-key window-numbering-keymap "\M-9" nil)

  (let ((prfx init-window-numbering-mode-map-prefix))
    (define-key window-numbering-keymap (kbd (concat prfx " 0")) 'select-window-0)
    (define-key window-numbering-keymap (kbd (concat prfx " 1")) 'select-window-1)
    (define-key window-numbering-keymap (kbd (concat prfx " 2")) 'select-window-2)
    (define-key window-numbering-keymap (kbd (concat prfx " 3")) 'select-window-3)
    (define-key window-numbering-keymap (kbd (concat prfx " 4")) 'select-window-4)
    (define-key window-numbering-keymap (kbd (concat prfx " 5")) 'select-window-5)
    (define-key window-numbering-keymap (kbd (concat prfx " 6")) 'select-window-6)
    (define-key window-numbering-keymap (kbd (concat prfx " 7")) 'select-window-7)
    (define-key window-numbering-keymap (kbd (concat prfx " 8")) 'select-window-8)
    (define-key window-numbering-keymap (kbd (concat prfx " 9")) 'select-window-9)))

(provide 'init-window-numbering)
