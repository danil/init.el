;;; init-company-elisp.el --- This file is part of Danil <https://danil.kutkevich.org> home.

;; Copyright (C) 2021 Danil <https://danil.kutkevich.org>.
;; Author: Danil <https://danil.kutkevich.org>
;; Maintainer: Danil <https://danil.kutkevich.org>
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

(add-hook 'after-init-hook 'noxrcp-company-elisp)
(defun noxrcp-company-elisp ()
  "No X recipe init."
  (if (boundp 'company-mode) (noxrcp-company-elisp--setup)
    (with-eval-after-load 'company (noxrcp-company-elisp--setup))))

(defun noxrcp-company-elisp--setup ()
  (add-hook 'emacs-lisp-mode-hook 'noxrcp-company-elisp--setup-emacs-lisp-mode))

(defun noxrcp-company-elisp--setup-emacs-lisp-mode ()
  (set (make-local-variable 'company-backends)
       (append '((
                  company-elisp
                  company-dabbrev-code
                  company-gtags
                  company-etags
                  company-keywords
                  )) company-backends)))

;;; init-company-elisp.el ends here
