(defgroup init-ethan-wspace nil
  "init-ethan-wspace"
  :group  'editing
  :tag    "init-ethan-wspace"
  :prefix "init-ethan-wspace-"
  :link   '(url-link :tag "GitHub" "https://github.com/danil/init.el"))

(defcustom init-ethan-wspace-mode-hooks '()
  "Major modes hooks associated with `ethan-wspace-mode'."
  :group 'init-ethan-wspace)

(defcustom init-ethan-wspace-disallows-no-nl-eof-modes '()
  "Major modes disallows no-nl-eof."
  :group 'init-ethan-wspace)

(defcustom init-ethan-wspace-disallows-many-nls-eof-modes '()
  "Major modes disallows many-nls-eof."
  :group 'init-ethan-wspace)

(defcustom init-ethan-wspace-disallows-tabs-modes '()
  "Major modes disallows tabs."
  :group 'init-ethan-wspace)

(defcustom init-ethan-wspace-disallows-eol-modes '()
  "Major modes disallows trailing whitespace at end of line."
  :group 'init-ethan-wspace)

(defun init-ethan-wspace ()
  ;; (if (boundp 'ethan-wspace-mode-line-element) (init-ethan-wspace--init)
  ;;   (with-eval-after-load 'ethan-wspace (init-ethan-wspace--init)))

  (dolist (hook init-ethan-wspace-mode-hooks)
    (add-hook hook 'init-ethan-wspace--lazy-setup)))

;; (defun init-ethan-wspace--init ()
;;   (setq ethan-wspace-mode-line-element nil) ;; typically looks like: ew:tLNm
;;   )

(defun init-ethan-wspace--lazy-setup ()
  "Run `ethan-wspace'."
  (init-lazy init-lazy-seconds nil 'init-ethan-wspace--setup))

(defun init-ethan-wspace--setup ()
  (unless (boundp 'ethan-wspace-errors) (load "ethan-wspace"))
  (make-local-variable 'ethan-wspace-errors)
  (setq ethan-wspace-errors '())

  (when (member major-mode init-ethan-wspace-disallows-no-nl-eof-modes)
    (setq ethan-wspace-errors (push 'no-nl-eof ethan-wspace-errors)))

  (when (member major-mode init-ethan-wspace-disallows-many-nls-eof-modes)
    (setq ethan-wspace-errors (push 'many-nls-eof ethan-wspace-errors)))

  (when (member major-mode init-ethan-wspace-disallows-tabs-modes)
    (setq ethan-wspace-errors (push 'tabs ethan-wspace-errors)))

  (when (member major-mode init-ethan-wspace-disallows-eol-modes)
    (setq ethan-wspace-errors (push 'eol ethan-wspace-errors)))

  (ethan-wspace-mode))

(provide 'init-ethan-wspace)
