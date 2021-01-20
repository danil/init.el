;;; init-nginx-mode.el --- This file is part of Danil <https://danil.kutkevich.org> home.

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

(defcustom noxrcp-nginx-mode-patterns '()
  "Regexp patterns associated with `logview'."
  :group 'noxrcp)

(custom-set-variables '(noxrcp-nginx-mode-patterns
                        '(
                          "/etc/nginx/.*\\.conf\\'"
                          "/etc/nginx/sites-available/"
                          )))

(add-hook 'after-init-hook 'noxrcp-nginx-mode)

(defun noxrcp-nginx-mode ()
  "No X recipe init."

  (dolist (pattern noxrcp-nginx-mode-patterns)
    (add-to-list 'auto-mode-alist (cons pattern 'nginx-mode))))

(defun noxrcp-nginx-mode--rainbow-identifiers-init ()
  (when (equal major-mode 'nginx-mode)
    (make-local-variable 'rainbow-identifiers-filter-functions)
    (add-hook 'rainbow-identifiers-filter-functions
              'noxrcp-rainbow-identifiers--face-overridable)

    (make-local-variable 'rainbow-identifiers-faces-to-override)
    (setq rainbow-identifiers-faces-to-override '(font-lock-keyword-face
                                                  font-lock-variable-name-face))

    (noxrcp-rainbow-identifiers--lazyinit)))

;;; init-nginx-mode.el ends here
