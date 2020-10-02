;;; init-anzu.el --- This file is part of Danil <danil@kutkevich.org> home.

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

(custom-set-faces
 '(anzu-mode-line ((((class color) (min-colors 88) (background dark))
                    (:background "black" :foreground "magenta" :weight bold))))
 '(anzu-mode-line-no-match ((((class color) (min-colors 88) (background dark))
                             (:inherit noxrcp-faces--alert-fixme)))))

(add-hook 'after-init-hook 'noxrcp-anzu)

(defun noxrcp-anzu ()
  "No X recipe init."

  (global-set-key (kbd "M-%") 'anzu-query-replace)
  (global-set-key (kbd "C-M-%") 'anzu-query-replace-regexp)

  (if (boundp 'global-anzu-mode) (noxrcp-lazy-anzu)
    (with-eval-after-load 'anzu (noxrcp-lazy-anzu))))

(defun noxrcp-lazy-anzu ()
  "My init lazy."
  (global-anzu-mode t)
  ;; (noxrcp-customize-anzu)
  )

;; (defun noxrcp-customize-anzu () "My init customize.")

;;; init-anzu.el ends here
