(defun init-dired-details ()
  (if (boundp 'dired-mode-map) (init-dired-details-lazy-init)
    (with-eval-after-load 'dired (init-dired-details-lazy-init))))

(defun init-dired-details-lazy-init ()
  (define-key dired-mode-map (kbd "b") 'init-dired-toggle-view)
  ;; (define-key dired-mode-map "(" 'dired-details-hide)
  ;; (define-key dired-mode-map ")" 'dired-details-show)

  (if (boundp 'dired-details-internal-overlay-list) (init-dired-details--lazy-init)
    (with-eval-after-load 'dired-details (init-dired-details--lazy-init)))

  (init-lazy (/ init-lazy-seconds 2) nil 'require 'dired-details))

(defun init-dired-details--lazy-init ()
  (add-hook 'dired-after-readin-hook 'init-dired-details--lazy-setup)

  (defadvice dired-revert (before remember-the-details activate)
    (dired-details-delete-overlays)))

(defun init-dired-details--lazy-setup ()
  "Run `dired-details'."
  (remove-hook 'dired-after-readin-hook 'init-dired-details--lazy-setup)
  (init-lazy init-lazy-seconds nil 'init-dired-details---lazy-setup))

(defun init-dired-details---lazy-setup ()
  (dired-details-activate)
  (add-hook 'dired-after-readin-hook 'dired-details-activate))

(defun init-dired-toggle-view ()
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
