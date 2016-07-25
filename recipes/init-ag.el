;;; init-ag.el --- This file is part of Danil <danil@kutkevich.org> home.

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

(add-hook 'after-init-hook 'init-ag)

(defun init-ag ()
  "Init."

  (define-key myinit-map (kbd "s a") 'ag)

  (define-key myinit-map (kbd "s A D") 'ag-dired-regexp)
  (define-key myinit-map (kbd "s A d") 'ag-dired)
  (define-key myinit-map (kbd "s A f") 'ag-files)
  (define-key myinit-map (kbd "s A k") 'my-ag-kill-buffers)
  (define-key myinit-map (kbd "s A r") 'ag-regexp)

  (my-init--after-load 'ag
    ;; (cond ((equal frame-background-mode 'dark)
    ;;        ;; (set-face-background 'ag-match-face "green3")
    ;;        (set-face-foreground 'ag-match-face "lightskyblue1")))
    (add-to-list 'ag-arguments "--width=5000")
    (set 'ag-highlight-search t)
    (setq ag-reuse-window 't)))

(defun my-ag-kill-buffers (&optional arg)
  (interactive "P")

  (if arg
      (progn (ag-kill-buffers) (message "All ag-mode buffers killed"))
    (ag-kill-other-buffers)
    (message "All ag-mode buffers other than the current buffer killed")))

;;; init-ag.el ends here
