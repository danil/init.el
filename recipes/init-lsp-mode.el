;;; init-lsp-mode.el --- This file is part of Danil <https://danil.kutkevich.org> home.

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

;; (defcustom noxrcp-lsp-mode--mode '()
;;   "Modes associated with `lsp-mode'."
;;   :group 'noxrcp)

;; (defcustom noxrcp-lsp-mode--mode-hooks '()
;;   "Mode hooks associated with `lsp-mode'."
;;   :group 'noxrcp)

;; (custom-set-variables
;;  '(noxrcp-lsp-mode--mode '(go-mode))
;;  '(noxrcp-lsp-mode--mode-hooks
;;    (mapcar (lambda (m) (intern (concat (symbol-name m) "-hook")))
;;            noxrcp-lsp-mode--mode)))

(add-hook 'after-init-hook 'noxrcp-lsp-mode)
(defun noxrcp-lsp-mode ()
  "No X recipe init."
  (require 'lsp-mode)
  ;; (if (boundp 'lsp-mode-map) (noxrcp-lsp-mode--customize)
  ;;   (with-eval-after-load 'lsp-mode (noxrcp-lsp-mode--customize)))
  )

;; (defun noxrcp-lsp-mode--customize ()
;;   ;; (setq lsp-keymap-prefix "s-l")
;;   (dolist (hook noxrcp-lsp-mode--mode-hooks) (add-hook hook #'lsp)))

;;; init-lsp-mode.el ends here
