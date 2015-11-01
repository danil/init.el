;;; init-quickrun.el --- This file is part of Danil <danil@kutkevich.org> home.

;; Copyright (C) 2015 Danil <danil@kutkevich.org>.
;; Author: Danil <danil@kutkevich.org>
;; Version: 0.0.1
;; Package-Requires: ((my-init))
;; Keywords: convenience
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

(my-after-init
  (global-set-key (my-kbd "! b") 'my-quickrun)
  (global-set-key (my-kbd "! r") 'my-quickrun-region)
  (global-set-key (my-kbd "! s") 'quickrun-shell))

(defun my-quickrun (&optional arg)
  (interactive "P")

  (if (equal arg '(4)) ;universal-argument <http://www.gnu.org/software/emacs/manual/html_node/elisp/Prefix-Command-Arguments.html>, <http://www.gnu.org/software/emacs/manual/html_node/emacs/Arguments.html>
      (call-interactively 'quickrun-with-arg)
    (call-interactively 'quickrun)))

(defun my-quickrun-region (&optional arg)
  (interactive "P")

  (if arg (call-interactively 'quickrun-replace-region)
    (call-interactively 'quickrun-region)))

;;; init-quickrun.el ends here
