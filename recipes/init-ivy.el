;;; init-ivy.el --- This file is part of Danil <danil@kutkevich.org> home.

;; Copyright (C) 2017 Danil <danil@kutkevich.org>.
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
 ;; '(ivy-use-virtual-buffers t)
 '(ivy-height 15)
 '(ivy-count-format "(%d/%d) "))

(add-hook 'after-init-hook 'myinit-ivy)

(defun myinit-ivy ()
  "My init."

  (if (boundp 'ivy-mode) (myinit-lazy-ivy)
    (with-eval-after-load 'ivy (myinit-lazy-ivy))))

(defun myinit-lazy-ivy ()
  "My init lazy."
  (ivy-mode 1)
  (myinit-customize-ivy))

(defun myinit-customize-ivy ()
  "My init customize."

  (myinit-customize-ivy-key)

  (if (boundp 'help-map) (myinit-customize-ivy-help)
    (with-eval-after-load 'help (myinit-customize-ivy-help)))

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

(defun myinit-customize-ivy-key ()
  "My init customize keys."
  (global-set-key (kbd "C-c C-R") 'ivy-resume)
  (define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)

  (global-set-key (kbd "M-x") 'counsel-M-x)
  (global-set-key (kbd "C-x C-f") 'counsel-find-file)
  (global-set-key (kbd "C-x C-r") 'counsel-recentf)

  ;; (global-set-key (kbd "C-c g") 'counsel-git)
  ;; (global-set-key (kbd "C-c j") 'counsel-git-grep)
  ;; (global-set-key (kbd "C-x l") 'counsel-locate)

  (define-key myinit-map (kbd "j a") 'counsel-ag))

(defun myinit-customize-ivy-help()
  "My init customize help."
  (define-key help-map (kbd "F") 'counsel-describe-face)
  (define-key help-map (kbd "f") 'counsel-describe-function)
  (define-key help-map (kbd "i") 'counsel-info-lookup-symbol)
  (define-key help-map (kbd "l") 'counsel-find-library)
  (define-key help-map (kbd "u") 'counsel-unicode-char)
  (define-key help-map (kbd "v") 'counsel-describe-variable))

;;; init-ivy.el ends here
