;;; init-window.el --- This file is part of Danil <danil@kutkevich.org> home.

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

;; Split vertical by default
;; <http://stackoverflow.com/questions/20167246/emacs-open-buffer-in-vertical-split-by-default#20514750>.
(custom-set-variables '(split-height-threshold nil) '(split-width-threshold 64))

(add-hook 'after-init-hook 'init-window)

(defun init-window ()
  "Init."

  (global-set-key (kbd "C-x 4 0") 'my-maybe-delete-window-maybe-kill-buffer) ;kill-buffer-and-window

  (global-set-key (kbd "<up>") #'scroll-down-line)
  (global-set-key (kbd "<down>") #'scroll-up-line)

  (global-set-key (kbd "<left>") #'scroll-right)
  (global-set-key (kbd "<right>") #'scroll-left)

  (define-key myinit-map (kbd "b") 'my-bury-buffer-maybe-delete-window)

  (define-key myinit-map (kbd "B n") 'rename-buffer))

(defun my-bury-buffer-maybe-delete-window (&optional arg)
  "Bury current buffer.
Delete selected window if no `ARG' and other windows present."
  (interactive "P")

  (bury-buffer)
  (when (and (not arg)
             (> (length (window-list)) 1))
    (delete-window (selected-window))))

;; <http://stackoverflow.com/questions/18325973/a-smarter-alternative-to-delete-window#18754481>.
(defun my-maybe-delete-window-maybe-kill-buffer (&optional arg)
  "Delete selected window unless `ARG'.
If no other window shows it buffer, kill the buffer too."
  (interactive "P")

  (let* ((w (selected-window))
         (b (window-buffer w)))

    (when (and (not arg)
               (> (length (window-list)) 1))

      (delete-window w))

    (when (or arg
              (= (length (window-list)) 1)
              (not (get-buffer-window b 'visible)))

      (kill-buffer b))))

;;; init-window.el ends here
