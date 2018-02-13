;;; init-mode-line.el --- This file is part of Danil <danil@kutkevich.org> home.

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
 '(mode-line-format '(
                      ;; mode-line-front-space
                      "%e"
                      mode-line-position
                      mode-line-client
                      mode-line-modified
                      mode-line-remote
                      mode-line-frame-identification
                      mode-line-buffer-identification
                      " "
                      mode-line-modes
                      mode-line-mule-info
                      (vc-mode vc-mode)
                      mode-line-misc-info
                      mode-line-end-spaces)))

(custom-set-faces
 '(mode-line ((((class color) (min-colors 88) (background dark)) (:background "black")))) ; :background gray10 purple4 MidnightBlue NavyBlue firebrick4 brown4 red4
 '(mode-line-inactive ((((class color) (min-colors 88) (background dark)) (:inherit shadow))))  ; :background gray30
 )

(add-hook 'after-init-hook 'myinit-mode-line)
(defun myinit-mode-line ()
  "My init."

  (add-hook 'window-configuration-change-hook 'myinit-mode-line--face-mode-line-update))

(defun myinit-mode-line--face-mode-line-update ()
  (if (equal (count-windows) 1)
      (custom-set-faces
       '(mode-line ((((class color) (min-colors 88) (background dark)) (:background "black")))))
    (custom-set-faces
     '(mode-line ((((class color) (min-colors 88) (background dark)) (:background "MidnightBlue")))))))

;;; init-mode-line.el ends here
