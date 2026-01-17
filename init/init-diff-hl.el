;;; This file is part of Danil Kutkevich <danil@kutkevich.org> home.

(defun init-diff-hl-toggle (arg) ; FIXME: Maybe replace a toggle function by minor mode?~~~~<danil@kutkevich.org>
  "Run `diff-hl'."
  (when (and
         (fboundp 'init-diff-hl--toggle)
         (fboundp 'diff-hl-mode)
         (fboundp 'diff-hl-margin-mode))
    (diff-hl-margin-mode arg)
    (diff-hl-mode arg)
    (init-diff-hl--toggle arg)))

(defun init-diff-hl--toggle (arg)
  "Init/setup or teardown/deinit `diff-hl'."
  (if arg (init-diff-hl-activate) (init-diff-hl-deactivate)))

;; (defface diff-file-header
;;   '((((class color) (min-colors 88) (background light))
;;      :background "grey75" :weight bold :extend t)
;;     (((class color) (min-colors 88) (background dark))
;;      :background "grey60" :weight bold :extend t)
;;     (((class color))
;;      :foreground "cyan" :weight bold :extend t)
;;     (t :weight bold :extend t))			; :height 1.3
;;   "`diff-mode' face used to highlight file header lines.")

;; (defface diff-index
;;   '((t :inherit diff-file-header))
;;   "`diff-mode' face used to highlight index header lines.")

(defun init-diff-hl-activate () ; FIXME: Maybe rename activate/deactivate function to setup/teardown function after replacing a toggle function by minor mode?~~~~<danil@kutkevich.org>
  "Init/setup `diff-hl'."
     (add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh)
     ;; (custom-set-faces
     ;;  '(diff-hl-insert ((((class color) (min-colors 88) (background dark)) (:background "magenta" :foreground "magenta")))))
     (when (equal frame-background-mode 'dark)
       ;; (set-face-attribute 'diff-hl-insert nil :inherit 'diff-added
       ;;                     :foreground "green" :background "black")
       (set-face-attribute 'diff-hl-insert nil :inherit 'diff-header) ;diff-added
       ;; (set-face-attribute 'diff-hl-change nil :inherit 'diff-changed
       ;;                     :foreground "brightblue" :background "black")
       (set-face-attribute 'diff-hl-change nil :inherit 'diff-header) ;diff-changed
       ;; (set-face-attribute 'diff-hl-delete nil :inherit 'diff-removed
       ;;                     :foreground "brightred" :background "black")
       (set-face-attribute 'diff-hl-delete nil :inherit 'diff-removed)))

(defun init-diff-hl-deactivate () ; FIXME: Maybe rename activate/deactivate function to setup/teardown function after replacing a toggle function by minor mode?~~~~<danil@kutkevich.org>
  "Teardown/deinit `diff-hl'."
  (remove-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh))

(provide 'init-diff-hl)
