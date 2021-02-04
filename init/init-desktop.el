;;; Desktop <http://emacswiki.org/DeskTop>.
;;(desktop-save-mode +1)
;; <http://stackoverflow.com/questions/4477376/some-emacs-desktop-save-questions-how-to-change-it-to-save-in-emacs-d-emacs#answer-4485083>.

(defgroup init-desktop nil
  "init-desktop"
  :group  'editing
  :tag    "init-desktop"
  :prefix "init-desktop-"
  :link   '(url-link :tag "GitHub" "https://github.com/danil/init.el"))

(defcustom init-desktop-mode-map-prefix "C-v " "init-desktop" :group 'init-desktop)

(defcustom init-desktop-mode-lighter " init-desktop" "init-desktop" :group 'init-desktop)

(defvar init-desktop-mode-map (make-sparse-keymap) "init-desktop")

(define-minor-mode init-desktop-mode "init-desktop" nil init-desktop-mode-lighter init-desktop-mode-map
  (init-desktop-setup))

(define-globalized-minor-mode init-global-desktop-mode init-desktop-mode
  (lambda () (init-desktop-mode +1)))

(defun init-desktop-setup ()
  (let ((map init-desktop-mode-map)
        (prfx init-desktop-mode-map-prefix))
    (define-key map (kbd (concat prfx " D s")) 'init-desktop-save)
    (define-key map (kbd (concat prfx " D l")) 'init-desktop-load)))

(defun init-desktop-save ()
  "Save the desktop."
  (interactive)
  (call-interactively 'desktop-save-in-desktop-dir))

(defun init-desktop-load ()
  "Load the desktop."
  (interactive)
  (call-interactively 'desktop-read))

(provide 'init-desktop)
