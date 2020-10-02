;;; init-sqlup-mode.el --- This file is part of Danil <danil@kutkevich.org> home.

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

;;; <https://www.emacswiki.org/emacs/SortWords>.

(add-hook 'after-init-hook 'noxrcp-sqlup-mode)

(defun noxrcp-sqlup-mode ()
  "My init."

  ;; (add-hook 'sql-mode-hook 'sqlup-mode) ;capitalize keywords in SQL mode
  (add-hook 'sql-interactive-mode-hook 'noxrcp-sqlup-mode-turn-on-or-off) ;capitalize keywords in an interactive session (e.g. psql)

  (define-key noxrcp-map (kbd "m s") 'sqlup-capitalize-keywords-in-region))

(defun noxrcp-sqlup-mode-turn-on-or-off ()
  "Enable or disable the `sqlup-mode' depending on current buffer `sql-product'."
  (interactive)

  (if (equal sql-product 'postgres)
      (sqlup-mode t)
    (sqlup-mode -1)))

;;; init-sqlup-mode.el ends here
