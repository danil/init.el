;;; init-hl-line.el --- This file is part of Danil <danil@kutkevich.org> home.

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

(add-hook 'after-init-hook 'myinit-hl-line)
(defun myinit-hl-line ()
  "My init."
  (define-key myinit-map (kbd "C-v") 'hl-line-mode)
  (if (boundp 'hl-line-mode) (myinit-hl-line--setup)
    (with-eval-after-load 'hl-line (myinit-hl-line--setup))))

(defun myinit-hl-line--setup ()
  ;; (defface hl-line-inactive
  ;;   '((t nil))
  ;;   "Inactive variant of `hl-line'."
  ;;   :group 'hl-line)
  ;; (add-hook 'buffer-list-update-hook
  ;;           (lambda () (walk-windows #'myinit-hl-line--update-face nil t)))
  (set-face-attribute hl-line-face nil :inherit nil :underline t))

;; (defun myinit-hl-line--update-face (window)
;;   "Update the `hl-line' face in WINDOW to indicate whether the window is selected."
;;   (with-current-buffer (window-buffer window)
;;     (when hl-line-mode
;;       (if (eq (current-buffer) (window-buffer (selected-window)))
;;           (face-remap-reset-base 'hl-line)
;;         (face-remap-set-base 'hl-line (face-all-attributes 'hl-line-inactive))))))

;;; init-hl-line.el ends here
