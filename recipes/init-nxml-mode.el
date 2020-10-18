;;; init-nxml-mode.el --- This file is part of Danil <danil@kutkevich.org> home.

;; Copyright (C) 2020 Danil <danil@kutkevich.org>.
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

(add-hook 'after-init-hook 'noxrcp-nxml-mode)

(defun noxrcp-nxml-mode ()
  "No X recipe init."

  (if (boundp 'nxml-mode-map) (noxrcp-nxml-mode--setup)
    (with-eval-after-load 'nxml-mode (noxrcp-nxml-mode--setup))))

(defun noxrcp-nxml-mode--setup ()
  (define-key nxml-mode-map (kbd "\C-c\C-f") nil))

(defun noxrcp-nxml-mode--rainbow-identifiers-init ()
  (when (equal major-mode 'nxml-mode)
    ;; (make-local-variable 'rainbow-identifiers-filter-functions)
    ;; (add-hook 'rainbow-identifiers-filter-functions
    ;;           'noxrcp-rainbow-identifiers--face-overridable)

    ;; (make-local-variable 'rainbow-identifiers-faces-to-override)
    ;; (setq rainbow-identifiers-faces-to-override '(nxml-element-local-name
    ;;                                               font-lock-function-name-face))

    (when (<= (count-lines (point-min) (point-max)) 50000) ;number of lines in current buffer
      (noxrcp-rainbow-identifiers--lazyinit))))

;;; init-nxml-mode.el ends here
