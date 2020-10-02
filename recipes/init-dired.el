;;; init-dired.el --- This file is part of Danil <danil@kutkevich.org> home.

;; Copyright (C) 2017 Danil <danil@kutkevich.org>.
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

;;; Reuse directory buffer
;;; <http://www.emacswiki.org/emacs/DiredReuseDirectoryBuffer>.
(put 'dired-find-alternate-file 'disabled nil)

(custom-set-variables '(dired-listing-switches "-l --all --human-readable"))

(defcustom noxrcp-dired--list-of-switches
  '("-l --all --human-readable" "-l --all")
  "List of ls switches for dired to cycle among.")

(add-hook 'after-init-hook 'noxrcp-dired)
(defun noxrcp-dired ()
  "No X recipe init."

  (global-set-key (kbd "C-x C-d") 'noxrcp-dired--open)

  (with-eval-after-load 'dired (noxrcp-dired--customize)))

(defun noxrcp-dired--customize ()
  (define-key dired-mode-map (kbd "^") 'noxrcp-dired--reuse-directory-buffer))

(defun noxrcp-dired--open(&optional arg)
  "Open `dired'."
  (interactive "P")

  (if arg
      (call-interactively 'ido-dired)

    (let* ((f (if buffer-file-name buffer-file-name default-directory))
           (d (if f (file-name-directory f) default-directory)))

      (dired d)
      (when f (dired-goto-file f)))))

(defun noxrcp-dired--reuse-directory-buffer ()
  "Reuse `dired' buffer."
  (interactive)

  (let ((d (expand-file-name default-directory)))

    (find-alternate-file "..")
    (when d (dired-goto-file d))))

;;; init-dired.el ends here
