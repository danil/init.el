;;; init-diff-mode.el --- This file is part of Danil <danil@kutkevich.org> home.

;; Copyright (C) 2016 Danil <danil@kutkevich.org>.
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

(add-hook 'diff-mode-hook (lambda ()
                            (my-diff-facelift)
                            (define-key diff-mode-shared-map (kbd "k") nil)))

;; (add-hook 'after-init-hook 'myinit-diff-mode)

;; (defun myinit-diff-mode ()
;;   "My init."

;;   (myinit--after-load 'diff-mode
;;     (define-key diff-mode-map "\C-c\C-f" nil)))

(defun my-diff-facelift ()
  (cond ((equal frame-background-mode 'light)
         )
        ((equal frame-background-mode 'dark)
         ;; Colors available to Emacs <http://raebear.net/comp/emacscolors.html>.
         (set-face-foreground 'diff-added "brightgreen")
         (set-face-foreground 'diff-removed "brightred")
         (set-face-foreground 'diff-changed "brightblue")
         (when (not window-system)
           (set-face-background 'diff-added "black3")
           (set-face-background 'diff-removed "black3")
           (set-face-background 'diff-changed "black3")
           (set-face-background 'diff-file-header "black")
           (set-face-background 'diff-hunk-header "black")))))

;;; init-diff-mode.el ends here
