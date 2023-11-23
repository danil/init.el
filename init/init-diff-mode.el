;;; This file is part of Danil Kutkevich <danil@kutkevich.org> home.

(defun init-diff-mode () (add-hook 'diff-mode-hook 'init-diff-mode-init))

(defun init-diff-mode-init ()
  (define-key diff-mode-shared-map (kbd "k") nil) ; FIXME: ????????????????????????????????????????????????????????????????????????????????

  (when (and (not window-system) (equal frame-background-mode 'dark))
        (set-face-background 'diff-added "black3") ; FIXME: Maybe use `custom-set-faces` within file `custom.el`?~~~~<danil@kutkevich.org>
        (set-face-background 'diff-removed "black3") ; FIXME: Maybe use `custom-set-faces` within file `custom.el`?~~~~<danil@kutkevich.org>
        (set-face-background 'diff-changed "black3") ; FIXME: Maybe use `custom-set-faces` within file `custom.el`?~~~~<danil@kutkevich.org>
        (set-face-background 'diff-file-header "black") ; FIXME: Maybe use `custom-set-faces` within file `custom.el`?~~~~<danil@kutkevich.org>
        (set-face-background 'diff-hunk-header "black") ; FIXME: Maybe use `custom-set-faces` within file `custom.el`?~~~~<danil@kutkevich.org>
        ))

(provide 'init-diff-mode)
