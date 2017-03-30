;;; init-highlight-symbol.el --- This file is part of Danil <danil@kutkevich.org> home.

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

(defcustom myinit-highlight-symbol-modes '()
  "Major modes associated with `highlight-symbol'."
  :group 'myinit)

(defcustom myinit-highlight-symbol-modes-hooks '()
  "Major modes Hook associated with `highlight-symbol'."
  :group 'myinit)

(custom-set-variables
 '(highlight-symbol-highlight-single-occurrence nil)
 '(highlight-symbol-idle-delay 0.5)
 '(highlight-symbol-ignore-list '("[*-]" "[$+=-][$+=-]+"))
 '(myinit-highlight-symbol-modes (-union myinit-programming-modes '(shell-mode)))
 '(myinit-highlight-symbol-modes-hooks (mapcar (lambda (m) (intern (concat (symbol-name m) "-hook"))) myinit-highlight-symbol-modes)))

(add-hook 'after-init-hook 'myinit-highlight-symbol)

(defun myinit-highlight-symbol ()
  "My init."

  (dolist (hook myinit-highlight-symbol-modes-hooks)
    (add-hook hook 'myinit-highlight-symbol--lazyinit))

  (with-eval-after-load 'highlight-symbol
    (define-key myinit-map (kbd "c S c") 'highlight-symbol-count)
    (define-key myinit-map (kbd "c S q") 'highlight-symbol-query-replace)

    (custom-set-faces '(highlight-symbol-face ((t (:inherit highlight)))))))

(defun myinit-highlight-symbol--lazyinit ()
  "Run `highlight-symbol'."

  (myinit-run-with-idle-timer-in-current-buffer
   myinit-default-idle-timer-seconds nil 'highlight-symbol-mode))

;;; init-highlight-symbol.el ends here
