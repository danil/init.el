;;; init-ac-ispell.el --- This file is part of Danil <danil@kutkevich.org> home.

;; Copyright (C) 2017 Danil <danil@kutkevich.org>.
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

(custom-set-variables '(ac-ispell-requires 1)) ;minimum input for starting completion

(add-hook 'after-init-hook 'noxrcp-ac-ispell)
(defun noxrcp-ac-ispell ()
  "My init."
  (noxrcp-add-mode-to-hooks 'my-ac-ispell-setup
                            noxrcp-auto-completion-modes-hooks))

(defun my-ac-ispell-setup ()
  (ac-ispell-setup)
  (add-to-list 'ac-sources 'ac-source-ispell t)
  (when (> ac-ispell-fuzzy-limit 0)
    (add-to-list 'ac-sources 'ac-source-ispell-fuzzy t)))

;;; init-ac-ispell.el ends here
