;;; init-fringe.el --- This file is part of Danil <https://danil.kutkevich.org> home.

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

(add-hook 'after-init-hook 'noxrcp-fringe)

(defun noxrcp-fringe ()
  "No X recipe init."
  (define-key noxrcp-map (kbd "x l") 'noxrcp-fringe--toggle))

(defun noxrcp-fringe--toggle ()
  "Toggle modes in the fringe (left margin of the window).
Toggle the `linume-mode', `diff-hl-mode' and so on."
  (interactive)
  (cond ((or
          (and (boundp 'linum-mode) (equal linum-mode t))
          (and (boundp 'diff-hl-mode) (equal diff-hl-mode t)))
         (when (fboundp 'linum-mode) (linum-mode -1))
         (when (fboundp 'noxrcp-diff-hl--init) (noxrcp-diff-hl--init -1)))
        (t
         (when (fboundp 'linum-mode) (linum-mode t))
         (noxrcp-run-with-idle-timer-in-current-buffer
          noxrcp-default-idle-timer-seconds nil
          (lambda () (noxrcp-diff-hl--init t))))))

;;; init-fringe.el ends here
