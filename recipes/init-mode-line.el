;;; init-mode-line.el --- This file is part of Danil <danil@kutkevich.org> home.

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

(custom-set-variables
 '(mode-line-format '("%e"
                      mode-line-position
                      ":"
                      mode-line-front-space ; line number and column number
                      mode-line-client
                      mode-line-modified
                      mode-line-frame-identification
                      mode-line-buffer-identification
                      " "
                      mode-line-modes
                      mode-line-remote
                      mode-line-mule-info
                      (vc-mode vc-mode)
                      mode-line-misc-info
                      mode-line-end-spaces)))

(custom-set-faces
 '(mode-line ((((class color) (min-colors 88) (background dark)) (:background "MidnightBlue")))) ;; :background color-52 OrangeRed4 MidnightBlue black gray10 purple4 MidnightBlue NavyBlue firebrick4 brown4 red4
 '(mode-line-inactive ((((class color) (min-colors 88) (background dark)) :inherit shadow :foreground "grey70" :background "gray30";; (:background "MidnightBlue")
                        ))))

(add-hook 'after-init-hook 'myinit-mode-line)
(defun myinit-mode-line ()
  "My init."
  ;; (remove-hook 'window-configuration-change-hook 'myinit-mode-line--face-mode-line-update-lazy)
  (add-hook 'window-configuration-change-hook 'myinit-mode-line--face-mode-line-update-lazy))

(defun myinit-mode-line--face-mode-line-update-lazy ()
  (run-with-idle-timer 0.1 nil (lambda ()
                                 (myinit-mode-line--face-mode-line-update))))

(defun myinit-mode-line--face-mode-line-update ()
  ;; (unless (active-minibuffer-window))
  (if (equal (count-windows) 1)
      (custom-set-faces
       '(mode-line ((((class color) (min-colors 88) (background dark)) (:background "black")))))
    (custom-set-faces
     '(mode-line ((((class color) (min-colors 88) (background dark)) (:background "MidnightBlue")))))))

;; ;; (defun myinit-mode-line--count-windows (&optional minibuf)
;; ;;   "Return the number of visible windows.
;; ;; The optional argument MINIBUF specifies whether the minibuffer
;; ;; window shall be counted.  See `walk-windows' for the precise
;; ;; meaning of this argument."
;; ;;   (let ((count 0))
;; ;;     (walk-windows (lambda (w) (setq count (+ count 1)))
;; ;;                   minibuf)
;; ;;     count))

;;; init-mode-line.el ends here
