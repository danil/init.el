;;; init-ediff.el --- This file is part of Danil <danil@kutkevich.org> home.

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

(add-hook 'after-init-hook 'myinit-ediff)
(defun myinit-ediff ()
  "My init."
  (if (boundp 'ediff-diff-options) (myinit-ediff--setup)
    (with-eval-after-load 'ediff (myinit-ediff--setup))))

(defun myinit-ediff--setup ()
  (cond ((equal frame-background-mode 'light)
         )
        ((equal frame-background-mode 'dark)
         (set-face-background 'ediff-even-diff-A "color-236")
         (set-face-background 'ediff-even-diff-Ancestor "color-235")
         (set-face-background 'ediff-even-diff-B "color-237")
         (set-face-background 'ediff-even-diff-C "color-238")
         (set-face-background 'ediff-odd-diff-A "color-240")
         (set-face-background 'ediff-odd-diff-Ancestor "color-239")
         (set-face-background 'ediff-odd-diff-B "color-241")
         (set-face-background 'ediff-odd-diff-C "color-242")

         (set-face-foreground 'ediff-current-diff-A nil)
         (set-face-foreground 'ediff-current-diff-B nil)
         (set-face-foreground 'ediff-current-diff-C nil)
         (set-face-background 'ediff-current-diff-A "DarkRed")
         (set-face-background 'ediff-current-diff-B "DarkGreen")
         (set-face-background 'ediff-current-diff-C "DarkOrange4")))
  )

;;; init-ediff.el ends here
