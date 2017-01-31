;;; init-yaml-mode.el --- This file is part of Danil <danil@kutkevich.org> home.

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

(add-hook 'after-init-hook 'myinit-yaml-mode)

(defun myinit-yaml-mode ()
  "My init."

  (myinit-add-mode-to-patterns 'yaml-mode
                                 "/\\(group\\|host\\)_vars/[^.]*\\'"
                                 "\\.ya?ml\\(\\.example\\)?\\'"))

(defun myinit-yaml-mode--rainbow-identifiers-init ()
  (when (equal major-mode 'yaml-mode)
    (make-local-variable 'rainbow-identifiers-filter-functions)
    (add-hook 'rainbow-identifiers-filter-functions
              'myinit-rainbow-identifiers--face-overridable)

    (make-local-variable 'rainbow-identifiers-faces-to-override)
    (setq rainbow-identifiers-faces-to-override '(font-lock-variable-name-face))

    (myinit-rainbow-identifiers--lazyinit)))

;;; init-yaml-mode.el ends here
