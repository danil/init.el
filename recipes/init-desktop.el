;;; init-desktop.el --- This file is part of Danil <danil@kutkevich.org> home.

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

;;; Desktop <http://emacswiki.org/DeskTop>.
;;(desktop-save-mode 1)
;; <http://stackoverflow.com/questions/4477376/some-emacs-desktop-save-questions-how-to-change-it-to-save-in-emacs-d-emacs#answer-4485083>.

(custom-set-variables
 '(desktop-base-file-name (convert-standard-filename "emacs-desktop"))
 '(desktop-base-lock-name (convert-standard-filename "emacs-desktop.lock"))
 '(desktop-dirname "~/.emacs.var/")
 '(desktop-globals-to-save '(desktop-missing-file-warning search-ring regexp-search-ring register-alist file-name-history))
 '(desktop-locals-to-save '(desktop-locals-to-save)) ; Itself! Think it over.
 '(desktop-path '(user-emacs-directory "~/.emacs.var/"))
 '(desktop-restore-frames nil))

(my-init--hook
  (define-key myinit-map (kbd "d s") 'save-my-desktop)
  (define-key myinit-map (kbd "d l") 'load-my-desktop))

(defun save-my-desktop ()
  "Save the desktop."

  (interactive)
  (call-interactively 'desktop-save-in-desktop-dir))

(defun load-my-desktop ()
  "Load the desktop."

  (interactive)
  (call-interactively 'desktop-read))

;;; init-desktop.el ends here
