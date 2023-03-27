;;; init-hl-todo.el --- This file is part of Danil <https://danil.kutkevich.org> home.

;; Copyright (C) 2023 Danil <https://danil.kutkevich.org>.
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

;; (custom-set-variables '(hl-todo-activate-in-modes '()))

(add-hook 'after-init-hook 'noxrcp-hl-todo)

(defun noxrcp-hl-todo ()
  "No X recipe init."

  (if (boundp 'hl-todo-mode-map) (noxrcp-hl-todo--init)
    (with-eval-after-load 'hl-todo (noxrcp-hl-todo--init)))

  (dolist (hook init-programming-modes-hooks)
    (add-hook hook 'noxrcp-hl-todo--lazyinit)))

(defun noxrcp-hl-todo--lazyinit ()
  "Run `hl-todo'."

  (init-lazy
   init-lazy-seconds nil
   (lambda () (hl-todo-mode))))

;; 1. #cdcd00
;; 2. #ff0087
;; 3. #00cdcd
;; 4. #af87ff
;; 5. #00ff87
;; 6. #ff8700
;; 7. #ff5faf
;; 8. #5f87ff
;; 9. #5f8700

(defun noxrcp-hl-todo--init ()
  (let ((faces '(("2FA"   . "#ff5fd7")
                 ("ARC"   . "#d7af00")
                 ("CHORE" . "#d0bf8f")
                 ("DEPRECATED" . "#db7093")
                 ("DEV"   . "#7cb8bb")
                 ("GEOS"  . "#2e8b57")
                 ("HOWTO"  . "#d0bf8f")
                 ("INVES" . "#af87ff")
                 ("MERCH" . "#eedd82")
                 ("PICT"  . "#5f9ea0")
                 ("PIN"   . "#ff875f")
                 ("PROD"  . "#ff5fd7")
                 ("PROV"  . "#d2691e")
                 ("PUB"   . "#7ec0ee")
                 ("PVT"   . "#00688b")
                 ("PWD"   . "#00afff")
                 ("RWX"   . "#db7093")
                 ("RX"    . "#6ca6cd")
                 ("STG"   . "#af87ff")
                 ("TROUBLESHOOTING" . "#eedd82")
                 ("VER[0-9]*" . "#7cb8bb"))))
    (setq hl-todo-keyword-faces (append hl-todo-keyword-faces faces))))

;;; init-hl-todo.el ends here
