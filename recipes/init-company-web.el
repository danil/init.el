;;; init-company-web.el --- This file is part of Danil <danil@kutkevich.org> home.

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

(add-hook 'after-init-hook 'myinit-company-web)
(defun myinit-company-web ()
  "My init."
  (if (boundp 'company-mode) (myinit-company-web--setup)
    (with-eval-after-load 'company (myinit-company-web--setup))))

(defun myinit-company-web--setup ()
  (add-hook 'html-mode-hook 'myinit-company-web--setup-web-mode)
  (add-hook 'jade-mode-hook 'myinit-company-web--setup-jade-mode)
  (add-hook 'slim-mode-hook 'myinit-company-web--setup-slim-mode)
  (add-hook 'web-mode-hook 'myinit-company-web--setup-web-mode))

(defun myinit-company-web--setup-web-mode ()
  (set (make-local-variable 'company-backends)
       (append '(company-web-html) company-backends)))

(defun myinit-company-web--setup-jade-mode ()
  (set (make-local-variable 'company-backends)
       (append '(company-web-jade) company-backends)))

(defun myinit-company-web--setup-slim-mode ()
  (set (make-local-variable 'company-backends)
       (append '(company-web-slim) company-backends)))

;;; init-company-web.el ends here
