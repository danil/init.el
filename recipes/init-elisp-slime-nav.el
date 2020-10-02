;;; init-elisp-slime-nav.el --- This file is part of Danil <danil@kutkevich.org> home.

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

(add-hook 'after-init-hook 'noxrcp-elisp-slime-nav)
(defun noxrcp-elisp-slime-nav ()
  "No X recipe init."
  ;; (if (boundp 'elisp-slime-nav-mode) (noxrcp-elisp-slime-nav--setup)
  ;;   (with-eval-after-load 'elisp-slime-nav (noxrcp-elisp-slime-nav--setup)))
  (when (fboundp 'elisp-slime-nav-mode) (noxrcp-elisp-slime-nav--setup)))

(defun noxrcp-elisp-slime-nav--setup ()
  (if (boundp 'emacs-lisp-mode-map) (noxrcp-emacs-lisp-mode--setup-emacs-lisp-mode)
    (with-eval-after-load 'elisp-mode (noxrcp-emacs-lisp-mode--setup-emacs-lisp-mode))))

(defun noxrcp-emacs-lisp-mode--setup-emacs-lisp-mode ()
  (add-hook 'emacs-lisp-mode-hook 'elisp-slime-nav-mode)
  (define-key emacs-lisp-mode-map (kbd "C-c C-j") 'elisp-slime-nav-find-elisp-thing-at-point)
  (define-key emacs-lisp-mode-map (kbd "C-c C-k") 'xref-pop-marker-stack))

;;; init-elisp-slime-nav.el ends here
