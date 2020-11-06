;;; init-counsel.el --- This file is part of Danil <danil@kutkevich.org> home.

;; Copyright (C) 2020 Danil <danil@kutkevich.org>.
;; Author: Danil <danil@kutkevich.org>
;; Maintainer: Danil <danil@kutkevich.org>
;; URL: https://github.com/danil/init.el

;;; Commentary:

;; Please see README.md for documentation.

;;; License:

;; This file is not part of GNU Emacs.
;; However, it is distributed under the same license.

;; GNU Emacs is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; GNU Emacs is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Code:

(defconst noxrcp-counsel--ag-base-command-name "ag")

(defconst noxrcp-counsel--ag-base-command-args
  (if (memq system-type '(ms-dos windows-nt))
      "--vimgrep"
    "--nocolor --nogroup"))

(custom-set-variables
 '(counsel-yank-pop-truncate-radius 4)
 '(counsel-ag-base-command (format "%s %s %s"
                                   noxrcp-counsel--ag-base-command-name
                                   noxrcp-counsel--ag-base-command-args
                                   "%s")))

(add-hook 'after-init-hook 'noxrcp-counsel)
(defun noxrcp-counsel ()
  "No X recipe init."
  (if (boundp 'counsel-mode) (noxrcp-counsel--setup)
    (with-eval-after-load 'counsel (noxrcp-counsel--setup)))
  ;; (counsel-mode t)
  )

(defun noxrcp-counsel--setup ()
  ;; (global-set-key (kbd "C-c g") 'counsel-git)
  ;; (global-set-key (kbd "C-x C-f") 'noxrcp-counsel--find-file) ; and also please see `init-files.el'
  ;; (global-set-key (kbd "C-x C-r") 'counsel-buffer-or-recentf)
  ;; (global-set-key (kbd "C-x b") 'ivy-switch-buffer)
  ;; (global-set-key (kbd "M-x") 'counsel-M-x)

  ;; (if (boundp 'counsel-find-file-map) (noxrcp-counsel--customize-keys)
  ;;   (with-eval-after-load 'counsel (noxrcp-counsel--customize-keys)))

  (if (boundp 'help-map) (noxrcp-counsel--customize-help)
    (with-eval-after-load 'help (noxrcp-counsel--customize-help)))

  (when (boundp 'minibuffer-local-map)
    (define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history))

  (when (boundp 'noxrcp-map)
    ;; (define-key noxrcp-map (kbd "j x") 'counsel-colors-web)
    ;; (define-key noxrcp-map (kbd "j x") 'counsel-git-log)
    (define-key noxrcp-map (kbd "j a") 'noxrcp-counsel--counsel-ag)
    (define-key noxrcp-map (kbd "j g") 'counsel-git-grep)
    (define-key noxrcp-map (kbd "j l") 'counsel-locate)
    (define-key noxrcp-map (kbd "j p") 'counsel-pt)
    (define-key noxrcp-map (kbd "j r") 'noxrcp-counsel--rg) ; counsel-projectile-rg
    ))

(defun noxrcp-counsel--customize-help()
  "My init customize."
  ;; (define-key help-map (kbd "F") 'counsel-describe-face)
  (define-key help-map (kbd "F") 'counsel-faces)
  (define-key help-map (kbd "b") 'counsel-descbinds)
  ;; (define-key help-map (kbd "f") 'counsel-describe-function)
  ;; (define-key help-map (kbd "i") 'counsel-info-lookup-symbol)
  (define-key help-map (kbd "l") 'counsel-find-library)
  ;; (define-key help-map (kbd "v") 'counsel-describe-variable)
  (define-key help-map (kbd "u") 'counsel-unicode-char))

(defun noxrcp-counsel--company ()
  "Complete using `company-candidates'."
  (interactive)
  (let ((initial-input (noxrcp-company--grab-symbol)))
    (unless company-candidates (company-complete))
    (when (and company-candidates company-point)
      (when (looking-back company-common (line-beginning-position))
        (setq ivy-completion-beg (match-beginning 0))
        (setq ivy-completion-end (match-end 0)))
      (ivy-read "Candidates: " company-candidates
                :action #'ivy-completion-in-region-action
                :initial-input initial-input ;(when initial-input (format "%s" initial-input))
                :unwind #'company-abort))))

;; (defun noxrcp-counsel--find-file ()
;;   (interactive)
;;   (cond ((equal current-prefix-arg 1) (call-interactively 'find-file))
;;         (current-prefix-arg (call-interactively 'find-file-literally))
;;         (t (call-interactively 'counsel-find-file))))

;; (defun noxrcp-counsel--customize-keys ()
;;   "My init customize keys."
;;   (define-key counsel-find-file-map (kbd "C-x C-f") 'noxrcp-counsel--counsel-find-file-fallback-command))

;; ;; <https://github.com/abo-abo/swiper/issues/257#issuecomment-147059504>,
;; ;; <https://github.com/abo-abo/swiper/issues/1333#issuecomment-436960474>.
;; (defun noxrcp-counsel--counsel-find-file-fallback-command ()
;;   "Fallback to non-counsel version of current command."
;;   (interactive)
;;   (when (bound-and-true-p ivy-mode)
;;     (ivy-mode -1)
;;     (add-hook 'minibuffer-setup-hook
;;               'noxrcp-counsel--counsel-find-file-fallback-command--enable-ivy))
;;   (ivy-set-action
;;    (lambda (current-path)
;;      (let ((old-default-directory default-directory))
;;        (let ((i (length current-path)))
;;          (while (> i 0)
;;            (push (aref current-path (setq i (1- i))) unread-command-events)))
;;        (let ((default-directory "")) (call-interactively 'find-file))
;;        (setq default-directory old-default-directory))))
;;   (ivy-done))

(defun noxrcp-counsel--counsel-find-file-fallback-command--enable-ivy ()
  (remove-hook 'minibuffer-setup-hook
               'noxrcp-counsel--counsel-find-file-fallback-command--enable-ivy)
  (ivy-mode t))

(defun noxrcp-counsel--counsel-ag (initial-directory)
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
                              noxrcp-counsel--ag-base-command-args
                              (format "--context=%s" n))))

      (counsel-ag initial-input initial-directory))))

(defun noxrcp-counsel--rg (initial-directory)
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

;; (defun noxrcp-counsel--counsel-yank-pop ()
;;   "Ivy replacement for `yank-pop'."
;;   (interactive)
;;   (if (member last-command '(yank yank-secondary yank-pop yank-pop-commands))
;;       (if (fboundp 'yank-pop-commands)
;;           (yank-pop-commands) ; second-sel.el
;;         (yank-pop))
;;     (require 'counsel)
;;     (if (eq last-command 'yank)
;;         (progn
;;           (setq ivy-completion-end (point))
;;           (setq ivy-completion-beg
;;                 (save-excursion
;;                   (search-backward (car kill-ring))
;;                   (point))))
;;       (setq ivy-completion-beg (point))
;;       (setq ivy-completion-end (point)))
;;     (let ((candidates
;;            (mapcar #'ivy-cleanup-string
;;                    (cl-remove-if
;;                     (lambda (s)
;;                       (string-match "\\`[\n[:blank:]]*\\'" s))
;;                     (delete-dups kill-ring)))))
;;       (let ((ivy-format-function #'counsel--yank-pop-format-function)
;;             (ivy-height 15))
;;         (ivy-read "kill-ring: " candidates
;;                   :action 'counsel-yank-pop-action
;;                   :caller 'counsel-yank-pop)))))

;;; init-counsel.el ends here
