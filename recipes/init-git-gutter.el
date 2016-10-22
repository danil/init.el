;;; init-git-gutter.el --- This file is part of Danil <danil@kutkevich.org> home.

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

(add-hook 'after-init-hook 'myinit-git-gutter)

(defun myinit-git-gutter ()
  "My init."

  (define-key myinit-map (kbd "V h k") 'git-gutter:revert-hunk)
  (define-key myinit-map (kbd "V h n") 'git-gutter:next-hunk)
  (define-key myinit-map (kbd "V h p") 'git-gutter:previous-hunk)

  ;; (myinit-after-load 'git-gutter
  ;;   (setq git-gutter:disabled-modes '(shell-mode magit-mode)))

  (dolist (hook myinit-programming-modes-hooks) (add-hook hook 'git-gutter-mode)))

(add-hook 'git-gutter-mode-on-hook
          (lambda ()
            (setq git-gutter:lighter " gg")
            (dolist (face '(git-gutter:added
                            git-gutter:deleted
                            git-gutter:modified
                            git-gutter:separator
                            git-gutter:unchanged))
              (set-face-background face my-line-numbers-background))))

;;; init-git-gutter.el ends here
