;;; init-company-inf-ruby.el --- This file is part of Danil <danil@kutkevich.org> home.

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

(add-hook 'after-init-hook 'myinit-company-inf-ruby)
(defun myinit-company-inf-ruby ()
  "My init."
  (if (boundp 'company-mode) (myinit-company-inf-ruby--setup)
    (with-eval-after-load 'company (myinit-company-inf-ruby--setup))))

(defun myinit-company-inf-ruby--setup ()
  (add-hook 'inf-ruby-mode-hook 'myinit-company-inf-ruby--setup-inf-ruby-mode))

(defun myinit-company-inf-ruby--setup-inf-ruby-mode ()
  (set (make-local-variable 'company-backends)
       (append '(company-inf-ruby) company-backends)))

;;; init-company-inf-ruby.el ends here
