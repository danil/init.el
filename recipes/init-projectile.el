;;; init-projectile.el --- This file is part of Danil <danil@kutkevich.org> home.

;; Copyright (C) 2019 Danil <danil@kutkevich.org>.
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

(defcustom myinit-projectile-modes '()
  "Major modes associated with `projectile'."
  :group 'myinit)

(defcustom myinit-projectile-modes-hooks '()
  "Major modes hook associated with `projectile'."
  :group 'myinit)

(custom-set-variables
 '(projectile-completion-system 'default) ;default=selectrum <https://github.com/raxod502/selectrum/wiki/Additional-Configuration#working-with-projects-in-projectile> ;'ivy ;'ido
 '(projectile-dynamic-mode-line nil)
 '(projectile-indexing-method 'alien) ; 'native ; 'alien ; 'hybrid ; error: Setting current directory: No such file or directory, some/path: No url found for submodule path 'some-module-name' in .gitmodules <https://github.com/syl20bnr/spacemacs/issues/11507>
 '(projectile-mode-line nil)
 '(myinit-projectile-modes (-union myinit-programming-modes
                                   '(
                                     dired-mode
                                     shell-mode
                                     sql-interactive-mode
                                     )))
 '(myinit-projectile-modes-hooks
   (mapcar (lambda (m) (intern (concat (symbol-name m) "-hook")))
           myinit-projectile-modes)))

(add-hook 'after-init-hook 'myinit-projectile)
(defun myinit-projectile ()
  "My init."
  (dolist (hook myinit-projectile-modes-hooks)
    (add-hook hook 'myinit-projectile--setup-hook)))

(defun myinit-projectile--setup-hook ()
  "Setup hook `projectile'."
  (if (boundp 'projectile) (myinit-projectile--setup-lazy)
    (with-eval-after-load 'projectile (myinit-projectile--setup-lazy))))

(defun myinit-projectile--setup-lazy ()
  "Lazy setup `projectile'."
  (myinit-run-with-idle-timer-in-current-buffer
   myinit-default-idle-timer-seconds nil 'myinit-projectile--init))

(defun myinit-projectile--init ()
  (projectile-mode +1)
  (define-key myinit-mode-map (kbd "C-c p") projectile-command-map)
  (counsel-projectile-mode +1))

;;; init-projectile.el ends here
