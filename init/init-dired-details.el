(defgroup init-dired-details nil
  "init-dired-details"
  :group  'editing
  :tag    "init-dired-details"
  :prefix "init-dired-details-"
  :link   '(url-link :tag "GitHub" "https://github.com/danil/init.el"))

(defcustom init-dired-details-key "b" "init-dired-details" :group 'init-dired-details)

(defun init-dired-details ()
  (if (boundp 'dired-details-internal-overlay-list) (init-dired-details-setup-details)
    (with-eval-after-load 'dired-details (init-dired-details-setup-details)))

  (if (boundp 'dired-mode-map) (init-dired-details-setup-dired)
    (with-eval-after-load 'dired (init-dired-details-setup-dired))))

(defun init-dired-details-setup-details ()
  (define-key dired-mode-map (kbd init-dired-details-key) 'init-dired-details-toggle-view)
  ;; (define-key dired-mode-map "(" 'dired-details-hide)
  ;; (define-key dired-mode-map ")" 'dired-details-show)
  (defadvice dired-revert (before remember-the-details activate)
    (dired-details-delete-overlays)))

(defun init-dired-details-setup-dired ()
  (init-lazy (/ init-lazy-seconds 2) nil 'require 'dired-details)
  (add-hook 'dired-after-readin-hook 'init-dired-details--setup-dired))

(defun init-dired-details--setup-dired ()
  "Run `dired-details'."
  (remove-hook 'dired-after-readin-hook 'init-dired-details--setup-dired)
  (init-lazy init-lazy-seconds nil 'init-dired-details---setup-dired))

(defun init-dired-details---setup-dired ()
  (dired-details-activate)
  (add-hook 'dired-after-readin-hook 'dired-details-activate))

(defun init-dired-details-toggle-view ()
  "Toggle through the list `dired-details-hide` `dired-details-show` and `ls` `dired-listing-switches` human readable and non human readable."
  (interactive)

  (cond ((eq dired-details-state 'hidden)
         (dired-details-show)
         (dired-sort-other "-l --all --human-readable")
         (digit-groups-mode -1))

        ((and (eq dired-details-state 'shown)
              (not digit-groups-mode))
         (dired-sort-other "-l --all")
         (digit-groups-mode +1))

        (t
         (dired-details-hide)
         (dired-sort-other "-l --all")
         (digit-groups-mode -1))))

(provide 'init-dired-details)
