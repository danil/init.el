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

(defcustom noxrcp-projectile-modes '()
  "Major modes associated with `projectile'."
  :group 'noxrcp)

(defcustom noxrcp-projectile-modes-hooks '()
  "Major modes hook associated with `projectile'."
  :group 'noxrcp)

(custom-set-variables
 '(projectile-completion-system 'noxrcp-selectrum--projectile-completing-read) ;'default = selectrum <https://github.com/raxod502/selectrum/wiki/Additional-Configuration#working-with-projects-in-projectile> ;'ivy ;'ido
 '(projectile-indexing-method 'alien) ; 'native ; 'alien ; 'hybrid ; error: Setting current directory: No such file or directory, some/path: No url found for submodule path 'some-module-name' in .gitmodules <https://github.com/syl20bnr/spacemacs/issues/11507>
 '(projectile-mode-line nil)
 '(noxrcp-projectile-modes (-union noxrcp-programming-modes
                                   '(
                                     dired-mode
                                     shell-mode
                                     sql-interactive-mode
                                     )))
 '(noxrcp-projectile-modes-hooks
   (mapcar (lambda (m) (intern (concat (symbol-name m) "-hook")))
           noxrcp-projectile-modes)))

(add-hook 'after-init-hook 'noxrcp-projectile)
(defun noxrcp-projectile ()
  "No X recipe init."
  (dolist (hook noxrcp-projectile-modes-hooks)
    (add-hook hook 'noxrcp-projectile--setup-hook)))

(defun noxrcp-projectile--setup-hook ()
  "Setup hook `projectile'."
  (if (boundp 'projectile) (noxrcp-projectile--setup-lazy)
    (with-eval-after-load 'projectile (noxrcp-projectile--setup-lazy))))

(defun noxrcp-projectile--setup-lazy ()
  "Lazy setup `projectile'."
  (noxrcp-run-with-idle-timer-in-current-buffer
   noxrcp-default-idle-timer-seconds nil 'noxrcp-projectile--init))

(defun noxrcp-projectile--init ()
  (projectile-mode +1)
  ;; (counsel-projectile-mode +1)
  (define-key noxrcp-mode-map (kbd "C-c p") projectile-command-map))

;;; init-projectile.el ends here
