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

(defconst myinit-ivy-ivy-height 15)

(custom-set-variables
 '(ivy-truncate-lines nil) ;because truncation not working
 '(ivy-count-format "(%d/%d) ")
 '(ivy-fixed-height-minibuffer t)
 '(ivy-use-virtual-buffers nil) ;;virtual buffers slow down switching between buffers
 '(ivy-height myinit-ivy-ivy-height))

;; (add-hook 'minibuffer-setup-hook (setq-local truncate-lines t))

(add-hook 'after-init-hook 'myinit-ivy)

(defun myinit-ivy ()
  "My init."
  (if (boundp 'ivy-mode) (myinit-lazy-ivy)
    (with-eval-after-load 'ivy (myinit-lazy-ivy))))

(defun myinit-lazy-ivy ()
  "My init lazy."
  ;; (ivy-mode 1)
  ;; (add-hook 'minibuffer-setup-hook (setq-local truncate-lines t)) ;<https://github.com/abo-abo/swiper/issues/1307#issuecomment-351911535>
  (myinit-customize-ivy))

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
