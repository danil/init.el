;;; init-json-mode.el --- This file is part of Danil <https://danil.kutkevich.org> home.

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

(defcustom noxrcp-json-mode-patterns '() "Regexp patterns associated with `json-mode'." :group 'noxinit)

(custom-set-variables
 '(json-encoding-default-indentation "    ")
 '(noxrcp-json-mode-patterns '("/composer\\.lock\\'" "\\.bowerrc\\'" "\\.json\\.example\\'" "\\.json\\.template\\'")))

(add-hook 'after-init-hook 'noxrcp-json-mode)

(defun noxrcp-json-mode ()
  "No X recipe init."

  (dolist (pattern noxrcp-json-mode-patterns)
    (add-to-list 'auto-mode-alist (cons pattern 'json-mode)))

  (add-hook 'json-mode-hook 'noxrcp-json-mode--customize)
  )

(defun noxrcp-json-mode--customize ()
  (make-local-variable 'js-indent-level)
  (setq js-indent-level 4))

(defun init-json-mode-rainbow-identifiers-setup ()
  (when (equal major-mode 'json-mode)
    (make-local-variable 'rainbow-identifiers-filter-functions)
    (add-hook 'rainbow-identifiers-filter-functions
              'init-rainbow-identifiers-face-overridable)

    (make-local-variable 'rainbow-identifiers-faces-to-override)
    (setq rainbow-identifiers-faces-to-override '(font-lock-keyword-face))

    (when (<= (count-lines (point-min) (point-max)) 50000) ;number of lines in current buffer
      (init-rainbow-identifiers--lazy-setup))))

;;; init-json-mode.el ends here
