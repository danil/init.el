;;; init-magit-blame.el --- This file is part of Danil <danil@kutkevich.org> home.

;; Copyright (C) 2014-2015 Danil <danil@kutkevich.org>.
;; Author: Danil <danil@kutkevich.org>
;; Version: 0.0.1
;; Package-Requires: ((my-init))
;; Keywords: convenience
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
(my-init--hook
  (define-key myinit-map (kbd "v d") 'magit-diff-buffer-file)
  (define-key myinit-map (kbd "v D") 'magit-diff)

  (define-key myinit-map (kbd "v l L") 'magit-log-long)
  (define-key myinit-map (kbd "v l f") 'magit-file-log)
  (define-key myinit-map (kbd "v l l") 'magit-log)

  (define-key myinit-map (kbd "v s") 'magit-show-commit)
  (define-key myinit-map (kbd "v S c") 'magit-show)

  (define-key myinit-map (kbd "V") 'magit-status)

  (my-init--after-load 'magit
    (define-key magit-mode-map (my-kbd "v S 1") 'magit-show-level-1-all)
    (define-key magit-mode-map (my-kbd "v S 2") 'magit-show-level-2-all)
    (define-key magit-mode-map (my-kbd "v S 3") 'magit-show-level-3-all)
    (define-key magit-mode-map (my-kbd "v S 4") 'magit-show-level-4-all)

    ;; Use ido to look for branches
    ;; <http://wikemacs.org/wiki/Magit#Use_ido_to_checkout_branches>.
    (setq magit-completing-read-function 'magit-ido-completing-read)

    ;; (define-key magit-diff-mode-map (kbd "C-c C-f") nil)

    (set-face-background 'magit-section-highlight nil)))

;;; TODO: Pass appropriate arguments to highlight-regexp.
;; (defun my-magit-show (&optional arg)
;;   (interactive "P")
;;   (if arg (magit-show-commit) (magit-show)))
;;; init-magit.el ends here
