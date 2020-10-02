;;; init-rbenv.el --- This file is part of Danil <danil@kutkevich.org> home.

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

;; Ruby with Emacs and Rbenv
;; <http://blog.senny.ch/blog/2013/02/11/use-the-right-ruby-with-emacs-and-rbenv>.
(custom-set-variables
 ;; '(rbenv-modeline-function 'my-rbenv--modeline-with-face)
 '(rbenv-show-active-ruby-in-modeline nil))

(add-hook 'after-init-hook 'noxrcp-rbenv)

(defun noxrcp-rbenv ()
  "No X recipe init."
  (global-rbenv-mode)
  (rbenv-use-corresponding))

;; (defun my-rbenv--modeline-with-face (current-ruby)
;;   "Show `CURRENT-RUBY' version in mode line."
;;   (list "R" current-ruby))

;;; init-rbenv.el ends here
