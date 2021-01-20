;;; init-corral.el --- This file is part of Danil <https://danil.kutkevich.org> home.

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

;;; Corral is an Smartparens replacement
;;; (quotes/parentheses/delimiters manager).

(add-hook 'after-init-hook 'noxrcp-corral)

(defun noxrcp-corral ()
  "No X recipe init."

  (define-key noxrcp-map (kbd "d (") 'corral-parentheses-backward)
  (define-key noxrcp-map (kbd "d )") 'corral-parentheses-forward)

  (define-key noxrcp-map (kbd "d [") 'corral-brackets-backward)
  (define-key noxrcp-map (kbd "d ]") 'corral-brackets-forward)

  (define-key noxrcp-map (kbd "d {") 'corral-braces-backward)
  (define-key noxrcp-map (kbd "d }") 'corral-braces-forward)

  (define-key noxrcp-map (kbd "d \" b") 'corral-double-quotes-backward)
  (define-key noxrcp-map (kbd "d \" f") 'corral-double-quotes-forward)

  (define-key noxrcp-map (kbd "d ' b") 'corral-single-quotes-backward)
  (define-key noxrcp-map (kbd "d ' f") 'corral-single-quotes-forward))

;;; init-corral.el ends here
