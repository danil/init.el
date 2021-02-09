(defgroup init-counsel nil
  "init-counsel"
  :group  'editing
  :tag    "init-counsel"
  :prefix "init-counsel-"
  :link   '(url-link :tag "GitHub" "https://github.com/danil/init.el"))

(defcustom init-counsel-mode-lighter " init-counsel" "init-counsel" :group 'init-counsel)

(defcustom init-counsel-mode-map-prefix "C-v " "init-counsel" :group 'init-counsel)

(defvar init-counsel-mode-map (make-sparse-keymap) "init-counsel")

(defconst init-counsel-ag-base-command-name "ag")

(defconst init-counsel-ag-base-command-args
  (if (memq system-type '(ms-dos windows-nt))
      "--vimgrep"
    "--nocolor --nogroup"))

(define-minor-mode init-counsel-mode "init-counsel" nil init-counsel-mode-lighter init-counsel-mode-map
  (init-counsel-setup))

(define-globalized-minor-mode init-global-counsel-mode init-counsel-mode
  (lambda () (init-counsel-mode +1)))

(defun init-counsel ()
  ;; (global-set-key (kbd "C-c g") 'counsel-git)
  ;; (global-set-key (kbd "C-x C-f") 'init-counsel-find-file) ; and also please see `init-files.el'
  ;; (global-set-key (kbd "C-x C-r") 'counsel-buffer-or-recentf)
  ;; (global-set-key (kbd "C-x b") 'ivy-switch-buffer)
  ;; (global-set-key (kbd "M-x") 'counsel-M-x)

  ;; (if (boundp 'counsel-find-file-map) (init-counsel-customize-keys)
  ;;   (with-eval-after-load 'counsel (init-counsel-customize-keys)))

  (define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)

  (if (boundp 'help-map) (init-counsel-customize-help-setup)
    (with-eval-after-load 'help (init-counsel-customize-help-setup))))

(defun init-counsel-setup ()
  (let ((map init-counsel-mode-map)
        (prfx init-counsel-mode-map-prefix))
    (define-key map (kbd (concat prfx " f a")) 'init-counsel-ag)
    (define-key map (kbd (concat prfx " f r")) 'init-counsel-rg)
    (define-key map (kbd (concat prfx " f p")) 'counsel-pt)
    (define-key map (kbd (concat prfx " f g")) 'counsel-git-grep)))

(defun init-counsel-customize-help-setup()
  "My init customize."
  ;; (define-key help-map (kbd "F") 'counsel-describe-face)
  (define-key help-map (kbd "F") 'counsel-faces)
  (define-key help-map (kbd "b") 'counsel-descbinds)
  ;; (define-key help-map (kbd "f") 'counsel-describe-function)
  ;; (define-key help-map (kbd "i") 'counsel-info-lookup-symbol)
  (define-key help-map (kbd "l") 'counsel-find-library)
  ;; (define-key help-map (kbd "v") 'counsel-describe-variable)
  (define-key help-map (kbd "u") 'counsel-unicode-char))

(defun init-counsel-company ()
  "Complete using `company-candidates'."
  (interactive)
  (let ((initial-input (init-company-grab-symbol)))
    (unless company-candidates (company-complete))
    (when (and company-candidates company-point)
      (when (looking-back company-common (line-beginning-position))
        (setq ivy-completion-beg (match-beginning 0))
        (setq ivy-completion-end (match-end 0)))
      (ivy-read "Candidates: " company-candidates
                :action #'ivy-completion-in-region-action
                :initial-input initial-input ;(when initial-input (format "%s" initial-input))
                :unwind #'company-abort))))

(defun init-counsel-find-file-fallback-command-enable-ivy ()
  (remove-hook 'minibuffer-setup-hook
               'init-counsel-find-file-fallback-command-enable-ivy)
  (ivy-mode t))

(defun init-counsel-ag (initial-directory)
  "Search using ag in a given `INITIAL-DIRECTORY`.

If `current-prefix-arg' is a integer then
pass context to ag like that: ag --context=`current-prefix-arg'.
If there is a symbol under cursor, then pass it as initial ag imput."
  (interactive (list (read-directory-name "Directory: ")))
  (let ((initial-input (if (symbol-at-point) (symbol-name (symbol-at-point)) "")))
    ;; counsel-projectile-ag
    (if (integerp current-prefix-arg)
        (let ((n current-prefix-arg))
          (setq current-prefix-arg nil)
          (counsel-ag initial-input initial-directory
                      (format "%s %s"
                              init-counsel-ag-base-command-args
                              (format "--context=%s" n))))

      (counsel-ag initial-input initial-directory))))

(defun init-counsel-rg (initial-directory)
  "Search using rg in a given `INITIAL-DIRECTORY`.

If `current-prefix-arg' is a integer then
pass context to rg like that: rg --context=`current-prefix-arg'.
If there is a symbol under cursor, then pass it as initial rg imput."
  (interactive (list (read-directory-name "Directory: ")))
  (let ((initial-input (if (symbol-at-point) (symbol-name (symbol-at-point)) "")))
    ;; counsel-projectile-rg
    (if (integerp current-prefix-arg)
        (let ((n current-prefix-arg))
          (setq current-prefix-arg nil)
          (counsel-rg initial-input initial-directory))

      (counsel-rg initial-input initial-directory))))

(provide 'init-counsel)
