;;; init-ivy.el --- This file is part of Danil <https://danil.kutkevich.org> home.

;; Copyright (C) 2021 Danil <https://danil.kutkevich.org>.
;; Author: Danil <https://danil.kutkevich.org>
;; Maintainer: Danil <https://danil.kutkevich.org>
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

(custom-set-variables
 ;; '(ivy-fixed-height-minibuffer nil)
 ;; '(ivy-fixed-height-minibuffer t)
 ;; '(ivy-height 11)
 '(ivy-truncate-lines nil) ; it is fixed by <<https://github.com/abo-abo/swiper/issues/1307>
 '(ivy-use-virtual-buffers nil) ; virtual buffers slow down switching between buffers
 '(ivy-count-format "(%d/%d) "))

(custom-set-faces
 '(ivy-current-match
   ((t :inverse-video t)))
 ;; '(ivy-current-match
 ;;   ((t :inherit highlight)))
 '(ivy-minibuffer-match-face-1
   ((t :background "gray10")))
 '(ivy-minibuffer-match-face-2
   ((t :background "red")))
 '(ivy-minibuffer-match-face-3
   ((t :background "blue")))
 '(ivy-minibuffer-match-face-4
   ((t :background "green4"))))

(add-hook 'after-init-hook 'noxrcp-ivy)
(defun noxrcp-ivy ()
  "No X recipe init."
  ;; (if (boundp 'ivy-mode) (noxrcp-ivy--setup)
  ;;   (with-eval-after-load 'ivy (noxrcp-ivy--setup)))
  ;; Be aware it breaks `find-file'!
  ;; (ivy-mode t)
  )

;; (defun noxrcp-ivy--setup ()
;;   ;; (define-key ivy-minibuffer-map (kbd "C-x C-f") 'noxrcp-ivy--minibuffer-ivy-fallback)
;;   ;; <https://github.com/abo-abo/swiper/issues/1307#issuecomment-365224375>.
;;   ;; (add-hook! 'minibuffer-setup-hook
;;   ;;   (when (member this-command '(
;;   ;;                                ivy-resume
;;   ;;                                ivy-switch-buffer
;;   ;;                                swiper
;;   ;;                                noxrcp-swiper--swiper
;;   ;;                                counsel-M-x
;;   ;;                                counsel-descbinds
;;   ;;                                counsel-describe-face
;;   ;;                                counsel-describe-function
;;   ;;                                counsel-describe-variable
;;   ;;                                counsel-faces
;;   ;;                                counsel-find-file
;;   ;;                                counsel-find-library
;;   ;;                                counsel-git
;;   ;;                                counsel-git-grep
;;   ;;                                counsel-info-lookup-symbol
;;   ;;                                counsel-locate
;;   ;;                                counsel-minibuffer-history
;;   ;;                                counsel-pt
;;   ;;                                counsel-recentf
;;   ;;                                counsel-recentf
;;   ;;                                counsel-rg
;;   ;;                                counsel-unicode-char
;;   ;;                                counsel-yank-pop
;;   ;;                                noxrcp-counsel--counsel-ag
;;   ;;                                noxrcp-counsel--counsel-yank-pop
;;   ;;                                projectile-switch-to-buffer
;;   ;;                                ))
;;   ;;     (setq-local truncate-lines t)))
;;   (noxrcp-ivy--customize))

;; ;; <https://github.com/abo-abo/swiper/issues/257#issuecomment-147059504>,
;; ;; <https://github.com/abo-abo/swiper/issues/1333>.
;; (defun noxrcp-ivy--minibuffer-ivy-fallback ()
;;   "Fallback to non ivy version of current command."
;;   (interactive)
;;   (when (bound-and-true-p ivy-mode)
;;     (ivy-mode -1)
;;     (add-hook 'minibuffer-setup-hook
;;               'noxrcp-ivy--minibuffer-ivy-fallback--enable-ivy))
;;   (ivy-set-action
;;    (lambda (current-path)
;;      (let ((old-default-directory default-directory))
;;        (when (not (member last-command '(
;;                                          dired-create-directory
;;                                          dired-do-copy
;;                                          dired-do-rename
;;                                          )))
;;          (let ((i (length current-path)))
;;            (while (> i 0)
;;              (push (aref current-path (setq i (1- i))) unread-command-events))))
;;        (let ((default-directory "")) (call-interactively last-command))
;;        (setq default-directory old-default-directory))))
;;   (ivy-done))

;; (defun noxrcp-ivy--minibuffer-ivy-fallback--enable-ivy  ()
;;   (remove-hook 'minibuffer-setup-hook
;;                'noxrcp-ivy--minibuffer-ivy-fallback--enable-ivy )
;;   (ivy-mode t))

;; (defun noxrcp-ivy--customize ()
;;   "My init customize."
;;   (global-set-key (kbd "C-c C-r") 'ivy-resume))

;;; init-ivy.el ends here
