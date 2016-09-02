;;; init-simp.el --- This file is part of Danil <danil@kutkevich.org> home.

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

(dolist (my-function
         '(
           simp-project-define
           simp-project-find-file
           simp-project-rgrep
           ))
  (autoload my-function "simp" nil t))

;; (global-set-key (kbd "C-c f f") 'simp-project-find-file)
;; (global-set-key (kbd "C-c f g") 'simp-project-rgrep)

(add-hook 'after-init-hook 'myinit-simp)

(defun myinit-simp ()
  "My init."

  (myinit-after-load 'simp
    (if (fboundp 'ido-mode)
        (setq simp-completing-read-command 'ido-completing-read)
      (myinit-after-load 'ido
        (setq simp-completing-read-command 'ido-completing-read)))

    (setq grep-find-ignored-directories ()) ;due to bug <https://github.com/re5et/simp/issues/2>

    (let ((rails-ignore '(.git
                          coverage
                          public/assets
                          public/images
                          public/system
                          tmp
                          vendor/cache))))

    (simp-project-define '(:has (.git) :ignore (.git)))
    (simp-project-define
     '(:type rails
             :has (config.ru app/models app/views app/controllers)
             :ignore ,rails-ignore))
    (simp-project-define
     '(:type emacs :has (init.el) :ignore (.git)))))

;;; init-simp.el ends here
