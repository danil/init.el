;;; init-ivy.el --- This file is part of Danil <danil@kutkevich.org> home.

;; Copyright (C) 2018 Danil <danil@kutkevich.org>.
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

(custom-set-variables
 '(ivy-truncate-lines t) ; it is fixed by <<https://github.com/abo-abo/swiper/issues/1307>
 '(ivy-count-format "(%d/%d) ")
 '(ivy-fixed-height-minibuffer t)
 '(ivy-use-virtual-buffers nil) ; virtual buffers slow down switching between buffers
 '(ivy-height 15))

(add-hook 'after-init-hook 'myinit-ivy)
(defun myinit-ivy ()
  "My init."
  (if (boundp 'ivy-mode) (myinit-ivy--setup)
    (with-eval-after-load 'ivy (myinit-ivy--setup)))
  ;; Be aware it breaks `find-file'!
  (ivy-mode t))

(defun myinit-ivy--setup ()
  (define-key ivy-minibuffer-map (kbd "C-x C-f") 'myinit-ivy--minibuffer-ivy-fallback)
  ;; <https://github.com/abo-abo/swiper/issues/1307#issuecomment-365224375>.
  (add-hook! 'minibuffer-setup-hook
    (when (member this-command '(
                                 ivy-resume
                                 ivy-switch-buffer
                                 swiper
                                 myinit-swiper--swiper
                                 counsel-M-x
                                 counsel-descbinds
                                 counsel-describe-face
                                 counsel-describe-function
                                 counsel-describe-variable
                                 counsel-faces
                                 counsel-find-file
                                 counsel-find-library
                                 counsel-git
                                 counsel-git-grep
                                 counsel-info-lookup-symbol
                                 counsel-locate
                                 counsel-minibuffer-history
                                 counsel-pt
                                 counsel-recentf
                                 counsel-recentf
                                 counsel-rg
                                 counsel-unicode-char
                                 counsel-yank-pop
                                 myinit-counsel--counsel-ag
                                 myinit-counsel--counsel-yank-pop
                                 projectile-switch-to-buffer
                                 ))
      (setq-local truncate-lines t)))
  (myinit-customize-ivy))

;; <https://github.com/abo-abo/swiper/issues/257#issuecomment-147059504>,
;; <https://github.com/abo-abo/swiper/issues/1333>.
(defun myinit-ivy--minibuffer-ivy-fallback ()
  "Fallback to non ivy version of current command."
  (interactive)
  (when (bound-and-true-p ivy-mode)
    (ivy-mode -1)
    (add-hook 'minibuffer-setup-hook
              'myinit-ivy--minibuffer-ivy-fallback--enable-ivy))
  (ivy-set-action
   (lambda (current-path)
     (let ((old-default-directory default-directory))
       (when (not (member last-command '(
                                         dired-create-directory
                                         dired-do-copy
                                         dired-do-rename
                                         )))
         (let ((i (length current-path)))
           (while (> i 0)
             (push (aref current-path (setq i (1- i))) unread-command-events))))
       (let ((default-directory "")) (call-interactively last-command))
       (setq default-directory old-default-directory))))
  (ivy-done))

(defun myinit-ivy--minibuffer-ivy-fallback--enable-ivy  ()
  (remove-hook 'minibuffer-setup-hook
               'myinit-ivy--minibuffer-ivy-fallback--enable-ivy )
  (ivy-mode t))

(defun myinit-customize-ivy ()
  "My init customize."
  (global-set-key (kbd "C-c C-r") 'ivy-resume)
  (myinit-customize-ivy-face))

(defun myinit-customize-ivy-face ()
  "My init customize face."
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
     ((t :background "green4")))))

;;; init-ivy.el ends here
