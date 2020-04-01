;;; init-lsp-mode.el --- This file is part of Danil <danil@kutkevich.org> home.

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

(defcustom myinit-lsp-mode--mode '()
  "Modes associated with `lsp-mode'."
  :group 'myinit)

(defcustom myinit-lsp-mode--mode-hooks '()
  "Mode hooks associated with `lsp-mode'."
  :group 'myinit)

(custom-set-variables
 '(myinit-lsp-mode--mode '(go-mode))
 '(myinit-lsp-mode--mode-hooks
   (mapcar (lambda (m) (intern (concat (symbol-name m) "-hook")))
           myinit-lsp-mode--mode)))

(add-hook 'after-init-hook 'myinit-lsp-mode)
(defun myinit-lsp-mode ()
  "My init."
  (require 'lsp-mode)
  (if (boundp 'lsp-mode-map) (myinit-lsp-mode--customize)
    (with-eval-after-load 'lsp-mode (myinit-lsp-mode--customize))))

(defun myinit-lsp-mode--customize ()
  ;; (setq lsp-keymap-prefix "s-l")
  (dolist (hook myinit-lsp-mode--mode-hooks) (add-hook hook #'lsp)))

;;; init-lsp-mode.el ends here
