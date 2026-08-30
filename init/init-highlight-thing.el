;;; -*- lexical-binding: t; -*-
(defgroup init-highlight-thing nil
  "init-highlight-thing"
  :group  'editing
  :tag    "init-highlight-thing"
  :prefix "init-highlight-thing-"
  :link   '(url-link :tag "GitHub" "https://github.com/danil/init.el"))

(defcustom init-highlight-thing-mode-lighter "" "init-highlight-thing" :group 'init-highlight-thing)

(defcustom init-highlight-thing-mode-hooks '()
  "Hooks to display whitespace characters."
  :group 'init-highlight-thing)

(define-globalized-minor-mode init-global-highlight-thing-mode init-highlight-thing-mode
  init-global-highlight-thing-mode-setup
  (unless init-global-highlight-thing-mode (init-global-highlight-thing-mode-teardown)))

(defun init-global-highlight-thing-mode-on ()  (interactive) (init-global-highlight-thing-mode +1))
(defun init-global-highlight-thing-mode-off () (interactive) (init-global-highlight-thing-mode -1))

(defun init-global-highlight-thing-mode-setup ()
  (when (fboundp 'global-highlight-thing-mode) (global-highlight-thing-mode t)))

(defun init-global-highlight-thing-mode-lazy-setup ()
  (init-lazy init-lazy-seconds nil 'init-highlight-thing-mode-on))

(defun init-global-highlight-thing-mode-teardown ()
  (when (fboundp 'global-highlight-thing-mode) (global-highlight-thing-mode -1)))

(define-minor-mode init-highlight-thing-mode "init-highlight-thing-mode" :init-value nil :lighter init-highlight-thing-mode-lighter
  (if init-highlight-thing-mode (init-highlight-thing-mode-setup) (init-highlight-thing-mode-teardown)))

(defun init-highlight-thing-mode-setup ()
  (when (fboundp 'highlight-thing-mode) (highlight-thing-mode t)))

(defun init-highlight-thing-mode-teardown ()
  (when (fboundp 'highlight-thing-mode) (highlight-thing-mode -1)))

(defun init-highlight-thing-mode-on ()  (interactive) (init-highlight-thing-mode +1))
(defun init-highlight-thing-mode-off () (interactive) (init-highlight-thing-mode -1))

(provide 'init-highlight-thing)
