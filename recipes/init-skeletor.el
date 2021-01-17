;;; init-skeletor.el --- This file is part of Danil <danil@kutkevich.org> home.

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

(custom-set-variables
 '(skeletor-completing-read-function 'selectrum-completing-read)
 '(skeletor-init-with-git nil)
 )

(add-hook 'after-init-hook 'noxrcp-skeletor)
(defun noxrcp-skeletor ()
  "No X recipe init."

  (skeletor-define-template "go-module"
    :title "Go Module"
    :default-license (rx bol "MIT")
    :substitutions
    '(("__GO-VERSION__" . (lambda ()
                            (shell-command-to-string "echo $(go version) | \
                                                      cut --delimiter=' ' --fields=3 |
                                                      tr --delete --complement --truncate-set1 '[0-9].' | \
                                                      cut --delimiter='.' --fields=1,2"))))))

;;; init-skeletor.el ends here
