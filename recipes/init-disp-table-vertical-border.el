;;; init-disp-table-line-wrap-and-truncation.el --- This file is part of Danil <danil@kutkevich.org> home.

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

;; Set whitespace as vertical separator character symbol
;; <http://stackoverflow.com/questions/18210631/how-to-change-the-character-composing-the-emacs-vertical-border#18211568>,
;; <https://lists.gnu.org/archive/html/help-gnu-emacs/2013-01/msg00271.html>
(unless standard-display-table
  (setq standard-display-table (make-display-table)))

(set-display-table-slot standard-display-table
                        'vertical-border (make-glyph-code 32)) ;(make-glyph-code 8203) is an zero width space ; ?\u200B is an zero width space ;(make-glyph-code 32) is an blank space ;?|))

;;; init-disp-table-vertical-border.el ends here
