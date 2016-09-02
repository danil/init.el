;;; init-ethan-wspace.el --- This file is part of Danil <danil@kutkevich.org> home.

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

(add-hook 'after-init-hook 'myinit-ethan-wspace)

(defun myinit-ethan-wspace ()
  "My init."

  (global-ethan-wspace-mode t)

  (myinit--after-load 'ethan-wspace
    (setq ethan-wspace-face-customized t) ;<http://github.com/glasserc/ethan-wspace/blob/master/lisp/ethan-wspace.el#L714>
    ;; (setq  ethan-wspace-mode-line-element nil) ;typically looks like: ew:tLNm

    (cond ((equal frame-background-mode 'dark)
           (set-face-background 'ethan-wspace-face "gray15")))

    (myinit--add-mode-to-hooks (lambda () (setq ethan-wspace-errors
                                            (remove 'tabs ethan-wspace-errors)))

                                '(c-mode-hook
                                  go-mode-hook
                                  makefile-gmake-mode-hook
                                  makefile-mode-hook))))

;;; init-ethan-wspace.el ends here
