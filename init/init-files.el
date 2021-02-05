(defgroup init-files nil
  "init-files"
  :group  'editing
  :tag    "init-files"
  :prefix "init-files-"
  :link   '(url-link :tag "GitHub" "https://github.com/danil/init.el"))

(defcustom init-files-map-prefix "C-v " "init-files" :group 'init-files)

(defun init-files ()
  (global-set-key (kbd "C-x C-f") 'init-files-find-file)
  (global-set-key (kbd "C-x C-d") 'init-files-list) ; 'list-directory

  (let ((prfx init-files-map-prefix))
    (global-set-key (kbd (concat prfx " B r")) 'revert-buffer)))

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
