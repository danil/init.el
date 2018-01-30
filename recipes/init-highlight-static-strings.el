;;; init-highlight-static-strings.el --- This file is part of Danil <danil@kutkevich.org> home.

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

(defcustom myinit-highlight-static-strings-hooks '()
  "Hooks associated with `highlight-static-strings-mode'."
  :group 'myinit)

(custom-set-variables
 ;; '(highlight-static-strings-activate-in-modes '())
 '(myinit-highlight-static-strings-hooks '(go-mode-hook)))

(add-hook 'after-init-hook 'myinit-highlight-static-strings)

(defun myinit-highlight-static-strings ()
  "My init."

  (dolist (hook myinit-highlight-static-strings-hooks)
    (add-hook hook 'myinit-highlight-static-strings--lazyinit)))

(defun myinit-highlight-static-strings--lazyinit ()
  "My init lazy."

  (myinit-run-with-idle-timer-in-current-buffer
   myinit-default-idle-timer-seconds nil
   (lambda ()
     (if (boundp 'highlight-static-strings-mode) (highlight-static-strings-mode)
       (with-eval-after-load 'highlight-static-strings (highlight-static-strings-mode))))))

;;; init-highlight-static-strings.el ends here
