;;; init-go-translate.el --- This file is part of Danil <danil@kutkevich.org> home.

;; Copyright (C) 2020 Danil <danil@kutkevich.org>.
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

;; * g refresh
;; * q exit
;; * x exchanges source language and target language and refresh the translation
;; * M-n and M-p, switch to the next/prev available translation direction, and refresh
;; * y to speak the current selection or word. You should have mplayer
;;   installed, or on Windows it will fallback to use powershell to do
;;   the tts job.

(add-hook 'after-init-hook 'myinit-go-translate)

(defun myinit-go-translate ()
  "My init."

  (if (boundp 'go-translate-base-url) (myinit-go-translate--init)
    (with-eval-after-load 'go-translate (myinit-go-translate--init)))

  (define-key myinit-map (kbd "t") 'go-translate))

(defun myinit-go-translate--init ()
  (setq go-translate-local-language "ru")
  (setq go-translate-target-language "en")

  (setq go-translate-extra-directions '(("en" . "ru"))))

;;; init-go-translate.el ends here
