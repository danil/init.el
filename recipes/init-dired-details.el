;;; init-dired-details.el --- This file is part of Danil <danil@kutkevich.org> home.

;; Copyright (C) 2017 Danil <danil@kutkevich.org>.
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
 '(dired-details-hidden-string "")
 '(dired-details-hide-extra-lines nil)
 '(dired-details-hide-link-targets nil))

(add-hook 'after-init-hook 'myinit-dired-details)

(defun myinit-dired-details ()
  "My init."

  (with-eval-after-load 'dired-details
    (define-key dired-mode-map (kbd "b") 'myinit-dired--toggle-view)
    ;; (define-key dired-mode-map "(" 'dired-details-hide)
    ;; (define-key dired-mode-map ")" 'dired-details-show)
    (defadvice dired-revert (before remember-the-details activate)
      (dired-details-delete-overlays)))

  (with-eval-after-load 'dired
    (myinit-run-with-idle-timer-in-current-buffer
     0.5 nil 'require 'dired-details)
    (add-hook 'dired-after-readin-hook 'myinit-dired-details--lazyinit)))


(defun myinit-dired--toggle-view ()
  "Toggle through the list `dired-details-hide` `dired-details-show` and `ls` `dired-listing-switches` human readable and non human readable."
  (interactive)

  (cond ((eq dired-details-state 'hidden)
         (dired-details-show)
         (dired-sort-other "-l --all --human-readable")
         (digit-groups-mode -1))

        ((and (eq dired-details-state 'shown)
              (not digit-groups-mode))
         (dired-sort-other "-l --all")
         (digit-groups-mode 1))

        (t
         (dired-details-hide)
         (dired-sort-other "-l --all")
         (digit-groups-mode -1))))

(defun myinit-dired-details--lazyinit ()
  "Run `dired-details'."
  (remove-hook 'dired-after-readin-hook 'myinit-dired-details--lazyinit)
  (myinit-run-with-idle-timer-in-current-buffer
   myinit-default-idle-timer-seconds nil
   (lambda ()
     (dired-details-activate)
     (add-hook 'dired-after-readin-hook 'dired-details-activate))))

;;; init-dired-details.el ends here
