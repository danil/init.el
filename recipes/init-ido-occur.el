;;; init-ido-occur.el --- This file is part of Danil <danil@kutkevich.org> home.

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

(add-hook 'after-init-hook 'init-ido-occur)

(defun init-ido-occur ()
  "Init."

  (define-key myinit-map (kbd "s o") 'ido-occur-at-point)
  (define-key myinit-map (kbd "s O") 'ido-occur)

  (my-init--after-load "isearch"
    (define-key isearch-mode-map (kbd "C-o") 'ido-occur-from-isearch)))

(defun ido-occur-at-point ()
  "Open ido-occur at point."
  (interactive)
  (ido-occur (symbol-name (symbol-at-point))))

(defun ido-occur-from-isearch ()
  "Open ido-occur from isearch."
  (interactive)
  (ido-occur (if isearch-regexp
                 isearch-string
               (regexp-quote isearch-string))))

;;; init-ido-occur.el ends here
