;;; init-subr.el --- This file is part of Danil <danil@kutkevich.org> home.

;; Copyright (C) 2021 Danil <danil@kutkevich.org>.
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

(add-hook 'after-init-hook 'noxrcp-subr)
(defun noxrcp-subr ()
  "No X recipe init."
    (if (boundp 'esc-map) (noxrcp-subr--setup-esc-map)
      (with-eval-after-load 'subr (noxrcp-subr--setup-esc-map)))
    (define-key noxrcp-map (kbd "x i d") 'noxrcp-subr--insert-timestamp))

(defun noxrcp-subr--setup-esc-map () (define-key esc-map "." nil))

(defun noxrcp-subr--insert-timestamp ()
  (interactive)

  (let ((n current-prefix-arg))
    (setq current-prefix-arg nil)

    (insert (cond ((equal n '(4))
                   (format-time-string "%s" nil "UTC0"))
                  ((equal n 4)
                   (format-time-string "%Y%m%d" nil "UTC0"))
                  (t
                   (format-time-string "%Y%m%dT%H%M%SZ" nil "UTC0"))))))

;;; init-subr.el ends here
