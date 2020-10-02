;;; init-enh-ruby-mode.el --- This file is part of Danil <danil@kutkevich.org> home.

;; Copyright (C) 2018 Danil <danil@kutkevich.org>.
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

(add-hook 'after-init-hook 'noxrcp-enh-ruby-mode)
(defun noxrcp-enh-ruby-mode ()
  "My init."
  ;; (setq enh-ruby-deep-indent-paren nil)
  ;; (setq enh-ruby-bounce-deep-indent t)
  ;; (add-to-list 'auto-mode-alist '("\\.rb\\'" . enh-ruby-mode))
  ;; (add-to-list 'interpreter-mode-alist '("\\.ruby\\'" . enh-ruby-mode))
  ;; (dolist (pattern noxrcp-ruby-mode-patterns)
  ;;   (add-to-list 'auto-mode-alist (cons pattern 'enh-ruby-mode)))
  (if (boundp 'enh-ruby-mode-map) (noxrcp-enh-ruby-mode--setup)
    (with-eval-after-load 'enh-ruby-mode (noxrcp-enh-ruby-mode--setup))))

(defun noxrcp-enh-ruby-mode--setup ()
  (define-key enh-ruby-mode-map (kbd "C-c C-k") 'xref-pop-marker-stack))

(defun noxrcp-enh-ruby-mode--rainbow-identifiers-init ()
  (when (equal major-mode 'enh-ruby-mode)
    (make-local-variable 'rainbow-identifiers-filter-functions)
    (add-hook 'rainbow-identifiers-filter-functions
              'rainbow-identifiers-face-overridable)
    (add-hook 'rainbow-identifiers-filter-functions
              'noxrcp-ruby-mode--rainbow-identifiers-filter)

    (make-local-variable 'rainbow-identifiers-faces-to-override)
    (setq rainbow-identifiers-faces-to-override '(font-lock-variable-name-face
                                                  font-lock-constant-face
                                                  enh-ruby-op-face
                                                  font-lock-type-face
                                                  font-lock-function-name-face))

    (noxrcp-rainbow-identifiers--lazyinit)))

;;; init-enh-ruby-mode.el ends here
