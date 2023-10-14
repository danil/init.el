(defgroup init-files nil
  "init-files"
  :group  'editing
  :tag    "init-files"
  :prefix "init-files-"
  :link   '(url-link :tag "GitHub" "https://github.com/danil/init.el"))

(defcustom init-files-map-prefix "C-v " "init-files" :group 'init-files)

;; (defcustom init-files-bindings '()
;;   "Keybindings enabled in `init-files'. This is not a keymap.
;; Rather it is an alist that is converted into a keymap just before `init-files'
;; is (re-)enabled. The keys are strings and the values are command symbols."
;;   :group 'init-files
;;   :type '(alist
;;           :key-type sexp
;;           :value-type function))

;; (define-minor-mode init-files "init-files" :init-value nil :lighter init-files-lighter :keymap init-files-map
;;   (if init-files (init-files-setup) (init-files-teardown)))

(defun init-files ()
  (global-set-key (kbd "C-x C-f") 'init-files-find-file)
  (global-set-key (kbd "C-x C-d") 'init-files-list) ; 'list-directory

  (let ((prefix init-files-map-prefix))
    (global-set-key (kbd (concat prefix " B r")) 'revert-buffer)))

(defun init-files-find-file ()
  (interactive)
  (let ((n current-prefix-arg))
    (setq current-prefix-arg nil)
    (cond ((equal n '(4))
           (setq current-prefix-arg '(4))
           (call-interactively 'counsel-fd-file-jump))
          ((equal n 7)
           (counsel-find-file))
          (t
           (call-interactively 'find-file)))))

(defun init-files-list ()
  (interactive)
  (let ((n current-prefix-arg))
    (cond ((equal n '(4))
           (call-interactively 'counsel-fd-dired-jump))
          ((equal n 1)
           (call-interactively 'list-directory))
          ((equal n 7)
           (call-interactively 'counsel-locate))
          (t
           (setq current-prefix-arg '(4))
           (call-interactively 'fd-dired)))))

(provide 'init-files)
