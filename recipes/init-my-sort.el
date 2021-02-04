;;; init-my-sort.el --- This file is part of Danil <https://danil.kutkevich.org> home.

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

;;; <https://www.emacswiki.org/emacs/SortWords>.

(add-hook 'after-init-hook 'noxrcp-my-sort)

(defun noxrcp-my-sort ()
  "No X recipe init."

  (define-key noxel-map (kbd "S c") 'my-sort-chars)
  (define-key noxel-map (kbd "S s") 'my-sort-symbols)
  (define-key noxel-map (kbd "S w") 'my-sort-words))

(defun my-sort-chars (reverse beg end)
  "Sort chars alphabetically in region (in `REVERSE' if negative)
Sort between `BEG' and `END'.
Prefixed with negative \\[universal-argument], sorts in reverse.

The variable `sort-fold-case' determines whether alphabetic case
affects the sort order.

See `sort-regexp-fields'."

      (interactive "*P\nr")
      (sort-regexp-fields reverse "." "\\&" beg end))

(defun my-sort-symbols (reverse beg end)
  "Sort symbols alphabetically in region (in `REVERSE' if negative)
Sort between `BEG' and `END'.
Prefixed with negative \\[universal-argument], sorts in reverse.
See `sort-words'."

      (interactive "*P\nr")
      (sort-regexp-fields reverse "\\(\\sw\\|\\s_\\)+" "\\&" beg end))

(defun my-sort-words (reverse beg end)
  "Sort words alphabetically in region (in `REVERSE' if negative).
Sort between `BEG' and `END'.
Prefixed with negative \\[universal-argument], sorts in reverse.

The variable `sort-fold-case' determines whether alphabetic case
affects the sort order.

See `sort-regexp-fields'."

      (interactive "*P\nr")
      (sort-regexp-fields reverse "\\w+" "\\&" beg end))

;;; init-my-sort.el ends here
