;;; init-window.el --- This file is part of Danil <https://danil.kutkevich.org> home.

;; Copyright (C) 2021 Danil <https://danil.kutkevich.org>.
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

;; Split vertical by default
;; <http://stackoverflow.com/questions/20167246/emacs-open-buffer-in-vertical-split-by-default#20514750>.
(custom-set-variables
 '(window-min-height 1)
 '(window-min-width 1)
 '(split-height-threshold nil)
 '(split-width-threshold 64))

(add-hook 'after-init-hook 'noxrcp-window)

(defun noxrcp-window ()
  "No X recipe init."

  (global-set-key (kbd "C-x 1") 'noxrcp-window--delete-other-windows)
  (global-set-key (kbd "C-x 4 0") 'noxrcp-window--maybe-delete-window-maybe-kill-buffer) ;kill-buffer-and-window
  (global-set-key (kbd "C-x k") 'noxrcp-window--maybe-delete-window-maybe-kill-buffer-open-dired)

  (global-set-key (kbd "<up>") #'scroll-down-line)
  (global-set-key (kbd "<down>") #'scroll-up-line)

  (global-set-key (kbd "<left>") #'scroll-right)
  (global-set-key (kbd "<right>") #'scroll-left)

  (define-key noxrcp-map (kbd "b") 'noxrcp-window--bury-buffer-maybe-delete-window)

  (define-key noxrcp-map (kbd "B n") 'rename-buffer))

(defun noxrcp-window--delete-other-windows ()
  "Make WINDOW fill its frame (`delete-other-windows').

If `current-prefix-arg' is the default argument then
run `maximize-window' function."
  (interactive)

  (if (equal current-prefix-arg '(4)) ;universal-argument <http://www.gnu.org/software/emacs/manual/html_node/elisp/Prefix-Command-Arguments.html>, <http://www.gnu.org/software/emacs/manual/html_node/emacs/Arguments.html>
      (call-interactively 'maximize-window)
    (call-interactively 'delete-other-windows)))

(defun noxrcp-window--bury-buffer-maybe-delete-window (&optional arg)
  "Bury current buffer.
Delete selected window if `ARG' and other windows present."
  (interactive "P")

  (bury-buffer)
  (when (and arg
             (> (length (window-list)) 1))
    (delete-window (selected-window))))

(defun noxrcp-window--maybe-delete-window-maybe-kill-buffer-open-dired (&optional arg)
  "If `ARG' then `kill-buffer' or maybe kill buffer and open `dired'."
  (interactive "P")

  (if (not arg)
      (call-interactively 'kill-buffer)

    (let* ((f buffer-file-name)
           (d (if f (file-name-directory f) default-directory)))

      (noxrcp-window--maybe-delete-window-maybe-kill-buffer arg)
      (dired d)
      (when f (dired-goto-file f)))))

;; <http://stackoverflow.com/questions/18325973/a-smarter-alternative-to-delete-window#18754481>.
(defun noxrcp-window--maybe-delete-window-maybe-kill-buffer (&optional arg)
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
