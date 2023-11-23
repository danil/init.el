;;; This file is part of Danil Kutkevich <danil@kutkevich.org> home.

(defgroup init-counsel nil
  "init-counsel"
  :group  'editing
  :tag    "init-counsel"
  :prefix "init-counsel-"
  :link   '(url-link :tag "GitHub" "https://github.com/danil/init.el"))

(defconst init-counsel-ag-base-command-name "ag")
(defconst init-counsel-ag-base-command-args (if (memq system-type '(ms-dos windows-nt)) "--vimgrep" "--nocolor --nogroup"))

;; (defun init-counsel ()
;;   (if (boundp 'counsel-find-file-map)
;;       (init-counsel-customize-keys)
;;     (with-eval-after-load 'counsel (init-counsel-customize-keys))))

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
