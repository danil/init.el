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

(custom-set-variables
 '(projectile-completion-system 'ivy) ;ido
 '(projectile-dynamic-mode-line nil)
 '(projectile-indexing-method 'alien) ; 'native ; 'alien ; 'hybrid ; error: Setting current directory: No such file or directory, some/path: No url found for submodule path 'some-module-name' in .gitmodules <https://github.com/syl20bnr/spacemacs/issues/11507>
 '(projectile-mode-line nil))

(add-hook 'after-init-hook 'myinit-projectile)
(defun myinit-projectile ()
  "My init."
  ;; (myinit-after-load 'projectile
  ;;   (setq projectile-project-root-files-bottom-up
  ;;         (append projectile-project-root-files-bottom-up
  ;;                 '("profiles" ; Gentoo portage overlay
  ;;                   ))))
  (projectile-global-mode)
  (if (boundp 'projectile) (myinit-projectile--init)
    (with-eval-after-load 'projectile (myinit-projectile--init))))

(defun myinit-projectile--init ()
  (define-key myinit-mode-map (kbd "C-c p") projectile-command-map))

;;; init-projectile.el ends here
