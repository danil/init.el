;;; init-linum.el --- This file is part of Danil <danil@kutkevich.org> home.

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

;;; Linum (line numbers).

(autoload 'linum-mode "linum" nil t)

(defcustom myinit-linum-max-lines 1000
  "My `linume-mode' max number of lines."
  :group 'myinit)

(defcustom myinit-linum-modes '()
  "Major modes associated with `linum-mode'."
  :group 'myinit)

(defcustom myinit-linum-modes-hooks '()
  "Major modes hooks associated with `linum-mode'."
  :group 'myinit)

(custom-set-variables
 '(myinit-linum-max-lines 5000)
 '(myinit-linum-modes (-difference myinit-programming-modes '(org-mode)))
 '(myinit-linum-modes-hooks (mapcar (lambda (m) (intern (concat (symbol-name m) "-hook"))) myinit-linum-modes)))

(add-hook 'after-init-hook 'myinit-linum)

(defun myinit-linum ()
  "My init."

  ;; (dolist (hook myinit-linum-modes-hooks) (add-hook hook 'myinit-linum-turn-on-or-off))
  (add-hook 'after-save-hook 'myinit-linum-turn-off)

  (define-key myinit-map (kbd "x l") 'myinit-linum-toggle)

  (with-eval-after-load 'linum
    (set-face-foreground 'linum my-line-numbers-foreground)
    (set-face-background 'linum my-line-numbers-background)))

(defun myinit-linum-toggle ()
  "Toggle the `linume-mode'."
  (interactive)

  (let ((g (lambda (x) (when (fboundp 'git-gutter-mode) (git-gutter-mode x)))))

    (cond ((and (boundp 'linum-mode) (equal linum-mode t))
           (funcall g -1) (linum-mode -1))
          (t
           (linum-mode t) (funcall g t)))))

(defun myinit-linum-turn-on-or-off ()
  "Enable or disable the `linume-mode' depending on current buffer lines number."
  (interactive)

  (if (myinit-linum--is-suitable) (linum-mode t) (linum-mode -1)))

(defun myinit-linum-turn-off ()
  "Disable the `linume-mode' if current buffer have to many lines."
  (interactive)

  (unless (myinit-linum--is-suitable) (linum-mode -1)))

(defun myinit-linum--is-suitable ()
  "Decides is suitably or not the `linume-mode' for the current buffer."

  (when (and (member major-mode myinit-linum-modes)
             (let ((buffer-lines (count-lines (point-min) (point-max)))) ;number of lines in current buffer
               (<= buffer-lines myinit-linum-max-lines)))
    t))

;;; init-linum.el ends here
