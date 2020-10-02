;;; init-magit.el --- This file is part of Danil <danil@kutkevich.org> home.

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
 '(magit-completing-read-function 'selectrum-completing-read)) ;'ivy-completing-read ;'magit-ido-completing-read

(add-hook 'after-init-hook 'noxrcp-magit)

(defun noxrcp-magit ()
  "My init."

  (define-key noxrcp-map (kbd "v") 'magit-status)

  (define-key noxrcp-map (kbd "V d") 'magit-diff-buffer-file)
  (define-key noxrcp-map (kbd "V D") 'magit-diff)

  (define-key noxrcp-map (kbd "V f") 'magit-find-file)

  (define-key noxrcp-map (kbd "V l") 'magit-log)

  (define-key noxrcp-map (kbd "V L l") 'magit-log-long)
  (define-key noxrcp-map (kbd "V L f") 'magit-file-log)

  (define-key noxrcp-map (kbd "V s") 'magit-show-commit)
  (define-key noxrcp-map (kbd "V S c") 'magit-show)

  (noxrcp-after-load 'magit
    (define-key magit-mode-map (my-kbd "V S 1") 'magit-show-level-1-all)
    (define-key magit-mode-map (my-kbd "V S 2") 'magit-show-level-2-all)
    (define-key magit-mode-map (my-kbd "V S 3") 'magit-show-level-3-all)
    (define-key magit-mode-map (my-kbd "V S 4") 'magit-show-level-4-all)

    ;; (define-key magit-diff-mode-map (kbd "C-c C-f") nil)

    (set-face-background 'magit-section-highlight nil)))

;;; TODO: Pass appropriate arguments to highlight-regexp.
;; (defun my-magit-show (&optional arg)
;;   (interactive "P")
;;   (if arg (magit-show-commit) (magit-show)))
;;; init-magit.el ends here
