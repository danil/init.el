(global-set-key "\C-cb" 'org-iswitchb)
;; (global-set-key "\C-cl" 'org-store-link)
;; (global-set-key "\C-ca" 'org-agenda)

(add-hook 'after-init-hook 'noxrcp-org-mode)

(defun noxrcp-org-mode ()
  "No X recipe init."

  (if (boundp 'org-mode-map) (init-org-mode-xxxxxxxxxx)
    (with-eval-after-load 'org (init-org-mode-xxxxxxxxxx))))

(defun init-org-mode-xxxxxxxxxx ()
  ;; (define-key org-mode-map "\C-c\C-f" nil)

  (setq org-log-done t)

  ;; Org-mode with Ido (interactively do things).
  (if (featurep 'ido-mode)
      (setq org-completion-use-ido t)

    (if (boundp 'org-completion-use-ido) (init-org-mode-yyyyyyyyyy)
      (with-eval-after-load 'ido (init-org-mode-yyyyyyyyyy))))

  ;; Org Clock.
  ;; Sometimes I change tasks I'm clocking
  ;; quickly - this removes clocked tasks with
  ;; 0:00 duration.
  ;;(setq org-clock-out-remove-zero-time-clocks t)

  ;; Org Agenda.
  (setq org-agenda-files
        (append (file-expand-wildcards "~/org/*.org")
                (file-expand-wildcards "~/org/home/*.org")
                (file-expand-wildcards "~/org/work/*.org")))

  ;; (load-library "find-lisp")
  ;; (setq org-agenda-files
  ;;       (find-lisp-find-files "~/org" "\.org\\'"))
  (setq org-agenda-custom-commands
        '(("h" "Home" todo "TODO"
           ((org-agenda-files
             (file-expand-wildcards "~/org/home/*.org"))))
          ("w" "Work" todo "TODO"
           ((org-agenda-files
             (file-expand-wildcards "~/org/work/*.org")))))))

(defun init-org-mode-yyyyyyyyyy ()
  (setq org-completion-use-ido t))
