;;; init-my-make-indirect-buffer.el --- This file is part of Danil <danil@kutkevich.org> home.

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

(defun my-make-indirect-buffer ()
  "Edit stuff in this buffer in an indirect buffer in same major mode."

  (interactive)
  (let* ((file-name (file-name-nondirectory (buffer-file-name)))
         (number "<2>") ;(generate-new-buffer-name (file-name))
         (buffer-name (generate-new-buffer-name (concat file-name number)))
         (buffer (make-indirect-buffer (current-buffer) buffer-name))
         (mode (with-current-buffer (current-buffer) major-mode)))

    (with-current-buffer buffer (funcall mode))

    (pop-to-buffer buffer)))

;;; init-my-make-indirect-buffer.el ends here
