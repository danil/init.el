;;; init-epa-file.el --- This file is part of Danil <https://danil.kutkevich.org> home.

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

;;; <https://www.emacswiki.org/emacs/EasyPG>
;;; <https://www.emacswiki.org/emacs/AutoEncryption>
;;; <https://unix.stackexchange.com/questions/55354/how-to-use-emacs-to-recognize-and-automatically-open-gpg-encrypted-file-in-ascii>
;;; <https://colinxy.github.io/software-installation/2016/09/24/emacs25-easypg-issue.html>
;;; <https://emacs.stackexchange.com/questions/27841/unable-to-decrypt-gpg-file-using-emacs-but-command-line-gpg-works>

(add-hook 'after-init-hook 'noxrcp-epa-file)
(defun noxrcp-epa-file ()
  "No X recipe init."
  (if (boundp 'epa-file) (noxrcp-epa-file--init)
    (with-eval-after-load 'epa-file (noxrcp-epa-file--init))))

(defun noxrcp-epa-file--init ()
  (setq epa-file-name-regexp "\\.\\(gpg\\|\\asc\\)\\(~\\|\\.~[0-9]+~\\)?\\'")
  (epa-file-name-regexp-update))

;;; init-epa-file.el ends here
