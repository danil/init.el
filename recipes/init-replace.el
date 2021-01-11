;;; init-replace.el --- This file is part of Danil <danil@kutkevich.org> home.

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

;; Truncate lines <http://stackoverflow.com/questions/950340/how-do-you-activate-line-wrapping-in-emacs#950406>.
(add-hook 'occur-mode-hook (lambda () (setq truncate-lines t)))

;; <http://lists.gnu.org/archive/html/emacs-devel/2005-07/msg00411.html>
(add-hook 'occur-hook (lambda () (occur-rename-buffer t)))

(add-hook 'after-init-hook 'noxrcp-replace)

(defun noxrcp-replace ()
  "No X recipe init."

  (global-set-key (kbd "M-s o") nil)
  (global-set-key (kbd "M-s o o") 'occur)
  (global-set-key (kbd "M-s o n") 'noccur-dired)
  (global-set-key (kbd "M-s o m") 'multi-occur-in-matching-buffers))

;;; init-replace.el ends here
