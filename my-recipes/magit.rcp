;;; magit-blame.rcp --- This file is part of Danil <danil@kutkevich.org> home.

;; Copyright (C) 2014-2015 Danil <danil@kutkevich.org>.
;; Author: Danil <danil@kutkevich.org>
;; Version: 0.0.0
;; Package-Requires: ()
;; Keywords: convenience
;; URL: http://danil.kutkevich.org/p/el/init.el

;;; Commentary:

;; Please see README.md for documentation, or read it online at
;; http://danil.kutkevich.org/p/el/init.el

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
(my-after-init
  (global-set-key (my-kbd "v l L") 'magit-log-long)
  (global-set-key (my-kbd "v l f") 'magit-file-log)
  (global-set-key (my-kbd "v l l") 'magit-log)
  (global-set-key (my-kbd "v s s") 'magit-status)
  (global-set-key (my-kbd "v s f") 'magit-show)
  (global-set-key (my-kbd "v s c") 'magit-show-commit)

  (my-eval-after-load 'magit
    (define-key magit-mode-map (my-kbd "v s s 1") 'magit-show-level-1-all)
    (define-key magit-mode-map (my-kbd "v s s 2") 'magit-show-level-2-all)
    (define-key magit-mode-map (my-kbd "v s s 3") 'magit-show-level-3-all)
    (define-key magit-mode-map (my-kbd "v s s 4") 'magit-show-level-4-all)

    ;; Use ido to look for branches
    ;; <http://wikemacs.org/wiki/Magit#Use_ido_to_checkout_branches>.
    (setq magit-completing-read-function 'magit-ido-completing-read)

    (define-key magit-diff-mode-map (kbd "C-c C-f") nil)))

;;; TODO: Pass appropriate arguments to highlight-regexp.
;; (defun my-magit-show (&optional arg)
;;   (interactive "P")
;;   (if arg (magit-show-commit) (magit-show)))
;;; magit.rcp ends here
