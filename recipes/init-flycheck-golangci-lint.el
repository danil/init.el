;;; init-flycheck-golangci-lint.el --- This file is part of Danil <https://danil.kutkevich.org> home.

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

(add-hook 'after-init-hook 'noxrcp-flycheck-golangci-lint)
(defun noxrcp-flycheck-golangci-lint ()
  "No X recipe init."
  (if (boundp 'flycheck-mode) (noxrcp-flycheck-golangci-lint--init)
    (with-eval-after-load 'flycheck (noxrcp-flycheck-golangci-lint--init))))

(defun noxrcp-flycheck-golangci-lint--init ()
  (flycheck-golangci-lint-setup)
  ;; (setq flycheck-golangci-lint-config "path/to/config") ;; --config (default: nil)
  ;; (setq flycheck-golangci-lint-fast t) ;; --fast (default: nil)
  ;; (setq flycheck-golangci-lint-tests t) ;; --tests (default: nil)
  ;; (setq flycheck-golangci-lint-deadline "30s") ;; --deadline (default: 1m)
  )

;;; init-flycheck-golangci-lint.el ends here
