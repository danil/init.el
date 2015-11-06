;;; init-disp-table-line-wrap-and-truncation.el --- This file is part of Danil <danil@kutkevich.org> home.

;; Copyright (C) 2015 Danil <danil@kutkevich.org>.
;; Author: Danil <danil@kutkevich.org>
;; Version: 0.0.1
;; Package-Requires: ((my-init))
;; Keywords: convenience
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

;; Set line-wrap and line-truncation characters
;; <http://en.wikipedia.org/wiki/Arrow_(symbol)>.

(unless standard-display-table
  (setq standard-display-table (make-display-table)))

(defface my-truncation-glyph-face
  '((t (:background "orchid3"))) ;orchid3 coral3 red
  "My custom face for the wrap glyphs.")


(defface my-wrap-glyph-face
  '((t (:background "limegreen"))) ;green4 ;green3 ;light green
  "My custom face for the wrap glyphs.")

;; Truncation
;; <http://stackoverflow.com/questions/8370778/remove-glyph-at-end-of-truncated-lines#8371037>.
(set-display-table-slot standard-display-table
                        0
                        (make-glyph-code ?\u0020 ;· \u00B7 dot ;→ U+2192 rightwards arrow
                                         'my-truncation-glyph-face))

;; Wrap
;; <http://emacswiki.org/emacs/LineWrap>.
(set-display-table-slot standard-display-table
                        'wrap
                        (make-glyph-code ?\u0020 ;· \u00B7 dot ;← U+2190 leftwards arrow
                                         ;; ?↵ ;U+21B5 crarr, downwards arrow with corner, leftwards (carriage return)
                                         'my-wrap-glyph-face))

;;; init-disp-table-line-wrap-and-truncation.el ends here
