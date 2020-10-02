;;; init-occur-mode.el --- This file is part of Danil <danil@kutkevich.org> home.

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

(add-hook 'occur-mode-hook
          (lambda ()
            ;; Truncate lines <http://stackoverflow.com/questions/950340/how-do-you-activate-line-wrapping-in-emacs#950406>.
            (setq truncate-lines t)))

(add-hook 'occur-hook
          (lambda ()
            ;; <http://lists.gnu.org/archive/html/emacs-devel/2005-07/msg00411.html>
            (occur-rename-buffer t)))

(add-hook 'after-init-hook 'noxrcp-occur-mode)

(defun noxrcp-occur-mode ()
  "My init."

  ;; (noxrcp-after-load "replace"
  ;;   (define-key occur-mode-map (kbd "\C-c\C-f") nil))

  (global-set-key (kbd "M-s o") nil)
  (global-set-key (kbd "M-s o o") 'my-occur)
  (global-set-key (kbd "M-s o k") 'my-occur-kill-buffers))

(defun my-occur (&optional arg)
  (interactive "P")
  (if arg
      (progn
        (setq current-prefix-arg 'nil)
        (call-interactively 'multi-occur-in-matching-buffers))
    (call-interactively 'occur)))

(defun my-occur-kill-buffers (&optional arg)
  (interactive "P")
  (if arg
      (progn (occur-kill-buffers) (message "All occur-mode buffers killed"))
    (occur-kill-other-buffers)
    (message "All occur-mode buffers other than the current buffer killed")))

(defun occur-kill-buffers ()
  "Kill all occur-mode buffers."
  (interactive)
  (dolist (buffer (buffer-list))
    (when (eq (buffer-local-value 'major-mode buffer) 'occur-mode)
      (kill-buffer buffer))))

(defun occur-kill-other-buffers ()
  "Kill all occur-mode buffers other than the current buffer."
  (interactive)
  (let ((current-buffer (current-buffer)))
    (dolist (buffer (buffer-list))
      (when (and
             (eq (buffer-local-value 'major-mode buffer) 'occur-mode)
             (not (eq buffer current-buffer)))
        (kill-buffer buffer)))))

;;; init-occur-mode.el ends here
