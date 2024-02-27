(defgroup init-overview-mode nil
  "init-overview-mode"
  :group  'editing
  :tag    "init-overview-mode"
  :prefix "init-overview-mode-"
  :link   '(url-link :tag "GitHub" "https://github.com/danil/init.el"))

(defun init-overview-mode--setup ()
  "Turn on the `display-line-numbers-mode' and so on."
  (interactive)

  (when (fboundp 'init-display-line-numbers-mode-on) (init-display-line-numbers-mode-on))
  (when (fboundp 'init-diff-hl-toggle) (init-diff-hl-toggle t))
  (when (fboundp 'init-leerzeichen-mode-on) (init-leerzeichen-mode-on))
  (when (fboundp 'global-highlight-thing-mode) (global-highlight-thing-mode t)))

(defun init-overview-mode--teardown ()
  "Turn off the `display-line-numbers-mode' and so on."
  (interactive)

  (when (fboundp 'init-display-line-numbers-mode-off) (init-display-line-numbers-mode-off))
  (when (fboundp 'init-diff-hl-toggle) (init-diff-hl-toggle -1))
  (when (fboundp 'init-leerzeichen-mode-off) (init-leerzeichen-mode-off))
  (when (fboundp 'global-highlight-thing-mode) (global-highlight-thing-mode -1)))

(defun init-overview-mode-toggle ()
  "Toggle the `display-line-numbers-mode' and so on."
  (interactive)

  (cond ((or (and (boundp 'init-display-line-numbers-mode) (equal init-display-line-numbers-mode t))
             (and (boundp 'diff-hl-mode) (equal diff-hl-mode t))
             (and (boundp 'init-leerzeichen-mode) (equal init-leerzeichen-mode t))
             (and (boundp 'global-highlight-thing-mode) (equal global-highlight-thing-mode t)))
         (init-overview-mode--teardown))
        (t
         (init-overview-mode--setup))))

(provide 'init-overview-mode)
