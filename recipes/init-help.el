;;; init-help.el --- This file is part of Danil <danil@kutkevich.org> home.

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

;; My help
;; <http://www.gnu.org/software/emacs/manual/html_node/emacs/Help-Summary.html>.

(add-hook 'after-init-hook 'myinit-help)

(defun myinit-help ()
  "My init."

  (define-key myinit-map (kbd "?") 'help-command) ;<http://www.gnu.org/software/emacs/manual/html_node/elisp/Help-Functions.html>

  (myinit--after-load 'help
    (define-key help-map "f" 'my-describe-function)

    (define-key help-map "?" nil)
    (define-key help-map (kbd "? ?") 'help-for-help)
    (define-key help-map (kbd "? m") 'man)
    (define-key help-map (kbd "? w") 'woman)))

(defun my-describe-function (&optional arg)
  (interactive "P")
  (if arg
      (call-interactively 'describe-function)
    (call-interactively 'find-function)))

;;; init-help.el ends here
