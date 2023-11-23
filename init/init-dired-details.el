;;; This file is part of Danil Kutkevich <danil@kutkevich.org> home.

(defgroup init-dired-details nil
  "init-dired-details"
  :group  'editing
  :tag    "init-dired-details"
  :prefix "init-dired-details-"
  :link   '(url-link :tag "GitHub" "https://github.com/danil/init.el"))

(defcustom init-dired-details-bindings '()
  "Keybindings enabled in `init-dired-mode'. This is not a keymap.
Rather it is an alist that is converted into a keymap just before `init-dired-mode'
is (re-)enabled. The keys are strings and the values are command symbols."
  :group 'init-dired
  :type '(alist
          :key-type sexp
          :value-type function))

(defun init-dired-details ()
  (if (boundp 'dired-details-internal-overlay-list) (init-dired-details-init-details)
    (with-eval-after-load 'dired-details (init-dired-details-init-details)))

  (if (boundp 'dired-mode-map) (init-dired-details-init-dired)
    (with-eval-after-load 'dired (init-dired-details-init-dired))))

(defun init-dired-details-init-details ()
  (dolist (b init-dired-details-bindings)
    (let ((key (car b)) (cmd (cdr b)) (map dired-mode-map))
      (define-key map (kbd key) cmd)))

  (defadvice dired-revert (before remember-the-details activate)
    (dired-details-delete-overlays)))

(defun init-dired-details-init-dired ()
  (init-lazy (/ init-lazy-seconds 2) nil 'require 'dired-details)
  (add-hook 'dired-after-readin-hook 'init-dired-details--init-dired))

(defun init-dired-details--init-dired ()
  "Run `dired-details'."
  (remove-hook 'dired-after-readin-hook 'init-dired-details--init-dired)
  (init-lazy init-lazy-seconds nil 'init-dired-details---init-dired))

(defun init-dired-details---init-dired ()
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
