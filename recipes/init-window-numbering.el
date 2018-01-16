;;; init-window-numbering.el --- This file is part of Danil <danil@kutkevich.org> home.

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

(autoload 'window-numbering-mode "window-numbering"
  "Numbered window shortcuts" t)

(add-hook 'after-init-hook 'myinit-window-numbering)

(defun myinit-window-numbering ()
  "My init."

  (window-numbering-mode)

  (myinit-after-load 'window-numbering
    ;; <http://blog.binchen.org/?p=512#sec-1>.
    (custom-set-faces
     '(window-numbering-face
       ((((class color) (min-colors 88) (background dark)) (:foreground "PaleGreen" :background "unspecified-bg" :inherit mode-line-inactive)))))

    (define-key window-numbering-keymap "\M-0" nil)
    (define-key window-numbering-keymap "\M-1" nil)
    (define-key window-numbering-keymap "\M-2" nil)
    (define-key window-numbering-keymap "\M-3" nil)
    (define-key window-numbering-keymap "\M-4" nil)
    (define-key window-numbering-keymap "\M-5" nil)
    (define-key window-numbering-keymap "\M-6" nil)
    (define-key window-numbering-keymap "\M-7" nil)
    (define-key window-numbering-keymap "\M-8" nil)
    (define-key window-numbering-keymap "\M-9" nil)

    (define-key window-numbering-keymap (my-kbd "0") 'select-window-0)
    (define-key window-numbering-keymap (my-kbd "1") 'select-window-1)
    (define-key window-numbering-keymap (my-kbd "2") 'select-window-2)
    (define-key window-numbering-keymap (my-kbd "3") 'select-window-3)
    (define-key window-numbering-keymap (my-kbd "4") 'select-window-4)
    (define-key window-numbering-keymap (my-kbd "5") 'select-window-5)
    (define-key window-numbering-keymap (my-kbd "6") 'select-window-6)
    (define-key window-numbering-keymap (my-kbd "7") 'select-window-7)
    (define-key window-numbering-keymap (my-kbd "8") 'select-window-8)
    (define-key window-numbering-keymap (my-kbd "9") 'select-window-9)))

;;; init-window-numbering.el ends here
