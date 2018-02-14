;;; init-cyphejor.el --- This file is part of Danil <danil@kutkevich.org> home.

;; Copyright (C) 2018 Danil <danil@kutkevich.org>.
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

(custom-set-variables '(cyphejor-rules '(
                                         ("Go" "go")
                                         ("JSX" "jsx")
                                         ("JavaScript" "js")
                                         ("bookmark" "boo")
                                         ("buffer" "buf")
                                         ("clojure" "clj")
                                         ("compilation" "cpl")
                                         ("diff" "dif")
                                         ("dired" "dir")
                                         ("emacs" "e")
                                         ("go" "go")
                                         ("inferior" "i" :prefix)
                                         ("interaction" "i" :prefix)
                                         ("interactive" "i" :prefix)
                                         ("lisp" "l" :postfix)
                                         ("markdown" "md")
                                         ("menu" "men" :postfix)
                                         ("mode" "")
                                         ("package" "pac")
                                         ("python" "py")
                                         ("shell" "sh" :postfix)
                                         ("text" "txt")
                                         ("wdired" "wdir"))))

(add-hook 'after-init-hook 'myinit-cyphejor)
(defun myinit-cyphejor ()
  "My init."
  (require 'cyphejor)
  (if (boundp 'cyphejor-rules) (myinit-cyphejor--lazyinit)
    (with-eval-after-load 'cyphejor (myinit-cyphejor--lazyinit))))

(defun myinit-cyphejor--lazyinit ()
  (myinit-run-with-idle-timer-in-current-buffer
   myinit-default-idle-timer-seconds nil (lambda () (cyphejor-mode 1))))

;;; init-cyphejor.el ends here
