;;; init-rust-mode.el --- This file is part of Danil <danil@kutkevich.org> home.

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

;; (add-hook 'after-init-hook 'noxrcp-rust-mode)
;; (defun noxrcp-rust-mode ()
;;   "My init."
;;   ;; (noxrcp-after-load 'rust-mode
;;   ;;   )
;;   )

(defun noxrcp-rust-mode--rainbow-identifiers-init ()
  (when (equal major-mode 'rust-mode)
    (make-local-variable 'rainbow-identifiers-filter-functions)
    (add-hook 'rainbow-identifiers-filter-functions
              'noxrcp-rust-mode--rainbow-identifiers-filter)

    (noxrcp-rainbow-identifiers--lazyinit)))

(defun noxrcp-rust-mode--rainbow-identifiers-filter (beg end)
  "My rainbow-identifiers custom init for symbol between `BEG' and `END'."

  (let ((face-cur (or (get-char-property beg 'read-face-name)
                      (get-char-property beg 'face)))
        (ch-cur (char-after beg))
        (str-cur (buffer-substring-no-properties beg end)))
    (and
     (or
      (eq face-cur 'default)
      (eq face-cur 'font-lock-variable-name-face)
      (eq face-cur nil))
     (not (member ch-cur
                  '(?% ?* ?+ ?- ?/ ?0 ?1 ?2 ?3 ?4 ?5 ?6 ?7 ?8 ?9 ?< ?< ?= ?> ?? ?_ ?`)))
     ;; (not (member str-cur '(
     ;;                                   )))
     )))

;;; init-rust-mode.el ends here
