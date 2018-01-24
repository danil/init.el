;;; init-faces.el --- This file is part of Danil <danil@kutkevich.org> home.

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

(defface myinit-faces--alert-fixme
  '((((background dark)) :foreground "green" :background "red" :weight bold)
    (((background light)) :foreground "green" :background "red" :weight bold))
  "Face for currently selected item in the helm buffer."
  :group 'myinit-faces)

(add-hook 'after-init-hook 'myinit-faces)

(defun myinit-faces ()
  "My init."

  (add-hook 'window-configuration-change-hook 'myinit-faces--face-mode-line-update))

;; <http://stackoverflow.com/questions/1242352/get-font-face-under-cursor-in-emacs#1242366>.
(defun my-face-at-point (pos)
  (interactive "d")
  (let ((face (or (get-char-property (point) 'read-face-name)
                  (get-char-property (point) 'face))))
    (if face (message "Face: %s" face) (message "No face at %d" pos))))

(defun myinit-faces--face-mode-line-update ()
  (if (equal (count-windows) 1)
      (custom-set-faces
       '(mode-line ((((class color) (min-colors 88) (background dark)) (:background "back")))))
    (custom-set-faces
     '(mode-line ((((class color) (min-colors 88) (background dark)) (:background "MidnightBlue")))))))

;;; init-faces.el ends here
