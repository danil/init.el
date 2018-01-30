;;; init-highlight-static-regexps.el --- This file is part of Danil <danil@kutkevich.org> home.

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

(defcustom myinit-highlight-static-regexps-hooks '()
  "Hooks associated with `highlight-static-regexps-mode'."
  :group 'myinit)

(custom-set-variables
 ;; '(highlight-static-regexps-activate-in-modes '())
 '(highlight-static-regexps-keyword-faces
   '((" := " . (:inherit default :weight bold))
     ("break" . (:inherit font-lock-keyword-face :weight bold))
     ("continue" . (:inherit font-lock-keyword-face :weight bold))
     ("goto" . (:inherit font-lock-keyword-face :weight bold))
     ("return" . (:inherit font-lock-keyword-face :weight bold))))
 '(myinit-highlight-static-regexps-hooks '(go-mode-hook)))

(add-hook 'after-init-hook 'myinit-highlight-static-regexps)

(defun myinit-highlight-static-regexps ()
  "My init."

  (dolist (hook myinit-highlight-static-regexps-hooks)
    (add-hook hook 'myinit-highlight-static-regexps--lazyinit)))

(defun myinit-highlight-static-regexps--lazyinit ()
  "My init lazy."

  (myinit-run-with-idle-timer-in-current-buffer
   myinit-default-idle-timer-seconds nil
   (lambda ()
     (if (boundp 'highlight-static-regexps-mode) (highlight-static-regexps-mode)
       (with-eval-after-load 'highlight-static-regexps (highlight-static-regexps-mode))))))

;;; init-highlight-static-regexps.el ends here
