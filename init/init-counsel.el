;;; This file is part of Danil Kutkevich <danil@kutkevich.org> home.

(defgroup init-counsel nil
  "init-counsel"
  :group  'editing
  :tag    "init-counsel"
  :prefix "init-counsel-"
  :link   '(url-link :tag "GitHub" "https://github.com/danil/init.el"))

(defconst init-counsel-ag-base-command-name "ag")
(defconst init-counsel-ag-base-command-args (if (memq system-type '(ms-dos windows-nt)) "--vimgrep" "--nocolor --nogroup"))

(defcustom init-counsel-ugrep-base-command
  `("ugrep"
    "--bool"
    "--color=never"
    "--line-number"
    "--column-number"
    "--recursive"
    "--hidden"
    "--ignore-case"
    "--ignore-binary"
    "--exclude-dir=.git"
    "%s")
  "Like `counsel-ag-base-command', but for `init-counsel-ugrep'.

Note: don't use single quotes for the regexp."
  :package-version '(counsel . "0.14.0")
  :type '(choice (repeat :tag "Command list to call directly" string)
                 (string :tag "Shell command")))

(defun init-counsel ()
  (if (boundp 'counsel-mode-map) (init-counsel-init)
    (with-eval-after-load 'counsel (init-counsel-init))))

(defun init-counsel-init ()
  ;; (if (boundp 'counsel-find-file-map)
  ;;     (init-counsel-customize-keys)
  ;;   (with-eval-after-load 'counsel (init-counsel-customize-keys)))

  ;; (ivy-configure 'init-counsel-ugrep
  ;;   :occur #'init-counsel-ugrep-occur
  ;;   :unwind-fn #'counsel--grep-unwind
  ;;   :display-transformer-fn #'counsel-git-grep-transformer
  ;;   :grep-p t
  ;;   :exit-codes '(1 "No matches found"))
  )

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

(defun init-counsel-rg (initial-directory &optional arguments)
  "Search using rg in a given `INITIAL-DIRECTORY`.

If `current-prefix-arg' is a integer then
pass context to rg like that: rg --context=`current-prefix-arg'.
If there is a symbol under cursor, then pass it as initial rg imput."
  (interactive (list (read-directory-name "Directory: ")))
  (let ((initial-input (if (symbol-at-point) (symbol-name (symbol-at-point)) "")))
    ;; counsel-projectile-rg
    ;; (if arguments
    (if (integerp current-prefix-arg)
        (let ((n current-prefix-arg))
          (setq current-prefix-arg nil)
          (counsel-rg initial-input initial-directory))

      (counsel-rg initial-input initial-directory))))

(defun init-counsel-ugrep (initial-directory &optional arguments)
  "Search using ugrep in a given `INITIAL-DIRECTORY`.

If `current-prefix-arg' is a integer then
pass context to ugrep like that: rg --context=`current-prefix-arg'.
If there is a symbol under cursor, then pass it as initial rg imput."
  (interactive (list (read-directory-name "Directory: ")))
  (let ((initial-input (if (symbol-at-point) (symbol-name (symbol-at-point)) "")))
    ;; counsel-projectile-rg
    ;; (if arguments
    (if (integerp current-prefix-arg)
        (let ((n current-prefix-arg))
          (setq current-prefix-arg nil)
          (init-counsel-ugrep initial-input initial-directory))

      (init-counsel-ugrep2 initial-input initial-directory))))

(defun init-counsel--ugrep-targets ()
  "Return a list of files to operate on, based on `dired-mode' marks."
  (when (derived-mode-p 'dired-mode)
    (declare-function dired-get-marked-files "dired")
    (declare-function dired-toggle-marks "dired")
    (let ((files
           (dired-get-marked-files 'no-dir nil nil t)))
      (when (or (cdr files)
                (when (ivy--string-search "*ivy-occur" (buffer-name))
                  (dired-toggle-marks)
                  (setq files (dired-get-marked-files 'no-dir))
                  (dired-toggle-marks)
                  t))
        (delq t files)))))

;;;###autoload
(defun init-counsel-ugrep2 (&optional initial-input initial-directory extra-rg-args rg-prompt)
  "Grep for a string in the current directory using `rg'.
INITIAL-INPUT can be given as the initial minibuffer input.
INITIAL-DIRECTORY, if non-nil, is used as the root directory for search.
EXTRA-RG-ARGS string, if non-nil, is appended to `init-counsel-ugrep-base-command'.
RG-PROMPT, if non-nil, is passed as `ivy-read' prompt argument.

Example input with inclusion and exclusion file patterns:
    require i -- -g*.el"
  (interactive)
  (let ((counsel-ag-base-command
         (if (listp init-counsel-ugrep-base-command)
             (append init-counsel-ugrep-base-command (init-counsel--ugrep-targets))
           (concat init-counsel-ugrep-base-command " "
                   (mapconcat #'shell-quote-argument (init-counsel--ugrep-targets) " "))))
        (counsel--grep-tool-look-around
         (let ((rg (car (if (listp init-counsel-ugrep-base-command) init-counsel-ugrep-base-command
                          (split-string init-counsel-ugrep-base-command))))
               (switch "--pcre2"))
           (and (eq 0 (call-process rg nil nil nil switch "--pcre2-version"))
                switch))))
    (counsel-ag initial-input initial-directory extra-rg-args rg-prompt
                :caller 'counsel-rg)))

(provide 'init-counsel)
