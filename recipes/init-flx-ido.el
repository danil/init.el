;;; init-flx-ido.el --- This file is part of Danil <https://danil.kutkevich.org> home.

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

(custom-set-variables
 '(ido-enable-flex-matching t)
 '(ido-use-faces nil))

(add-hook 'after-init-hook 'noxrcp-flx-ido)

(defun noxrcp-flx-ido ()
  "No X recipe init."

  ;; (with-eval-after-load 'flx-ido)

  (if (boundp 'ido-mode) (noxrcp-lazy-flx-ido)
    (with-eval-after-load 'ido (noxrcp-lazy-flx-ido))))

(defun noxrcp-lazy-flx-ido ()
  "My init lazy."
  (flx-ido-mode t))

;;; init-flx-ido.el ends here
