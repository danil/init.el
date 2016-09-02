(global-set-key "\C-cb" 'org-iswitchb)
;; (global-set-key "\C-cl" 'org-store-link)
;; (global-set-key "\C-ca" 'org-agenda)

(add-hook 'after-init-hook 'myinit-org-mode)

(defun myinit-org-mode ()
  "My init."

  (myinit-after-load 'org
    ;; (define-key org-mode-map "\C-c\C-f" nil)

    (setq org-log-done t)

    ;; Org-mode with Ido (interactively do things).
    (if (featurep 'ido-mode)
        (setq org-completion-use-ido t)
      (myinit-after-load 'ido
        (setq org-completion-use-ido t)))

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
               (file-expand-wildcards "~/org/work/*.org"))))))))
