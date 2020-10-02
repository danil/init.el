;;; init-rainbow-mode.el --- This file is part of Danil <danil@kutkevich.org> home.

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

(defcustom noxrcp-rainbow-modes '()
  "Major modes associated with `rainbow-modes'."
  :group 'noxrcp)

(defcustom noxrcp-rainbow-modes-hooks '()
  "Major modes Hook associated with `rainbow-modes'."
  :group 'noxrcp)

(custom-set-variables
 '(noxrcp-rainbow-modes '(
                          css-mode
                          less-css-mode
                          nxml-mode
                          php-mode
                          sass-mode
                          scss-mode
                          web-mode
                          xml-mode
                          ))
 '(noxrcp-rainbow-modes-hooks
   (mapcar (lambda (m) (intern (concat (symbol-name m) "-hook")))
           noxrcp-rainbow-modes))
 '(rainbow-html-colors-major-mode-list '(
                                         css-mode
                                         html-mode
                                         less-css-mode
                                         nxml-mode
                                         php-mode
                                         sass-mode
                                         scss-mode
                                         xml-mode
                                         )))

(add-hook 'after-init-hook 'noxrcp-rainbow-mode)

(defun noxrcp-rainbow-mode ()
  "My init."

  (dolist (hook noxrcp-rainbow-modes-hooks)
    (add-hook hook 'noxrcp-rainbow-mode--lazyinit)))

(defun noxrcp-rainbow-mode--lazyinit ()
  "Run `rainbow-mode'."

  (noxrcp-run-with-idle-timer-in-current-buffer
   noxrcp-default-idle-timer-seconds nil (lambda () (rainbow-mode t))))

;;; init-rainbow-mode.el ends here
