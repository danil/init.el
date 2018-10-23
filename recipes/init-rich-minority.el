;;; init-rich-minority.el --- This file is part of Danil <danil@kutkevich.org> home.

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
 '(rm-text-properties
   '(
     ;; Emacs SEGFAULT!!! (under certain circumstances)
     ;; if touching flycheck-mode's lighters!
     ;; Instead customize `flycheck-mode-line`
     ;; variable (and
     ;; `flycheck-mode-line-status-text` fn) and
     ;; `flycheck-mode-line-prefix` variable!
     ;; ("\\` Compiling\\'" 'display " C*") ;∞ U+221E infin or infinity
     ;; ("\\` Ovwrt\\'" 'display (concat " "
     ;;                                  (propertize "OVERWRITING" 'font-lock-face
     ;;                                              '(:inherit myinit-faces--alert-fixme))))
     ))
 ;; Hide lighters for some minor modes.
 '(rm-blacklist '(
                  " hl-p"

                  " ," ;wtf!???
                  " =>" ;aggressive-indent
                  " AC" ;auto-complete-mode
                  " ARev" ;auto-revert-mode
                  " Abbrev" ;abbrev-mode
                  " Anzu" ;anzu-mode
                  " Helm" ;helm-mode
                  " Isearch" ;isearch-mode
                  " MRev" ;magit-auto-revert-mode
                  " Myinit" ;myinit-mode
                  " Rails" ;projectile-rails
                  " Rbow" ;rainbow-mode
                  " RubyRef" ;ruby-refactor-mode
                  " robe" ;robe-mode
                  " SP" ;smartparens-mode
                  " Undo-Tree" ;undo-tree-mode
                  " end" ;ruby-end-mode
                  " ew:mnl" ;ethan-wspace find NO errors in Makefile, C or Go sources
                  " ew:mnlt" ;ethan-wspace find NO errors (highlight trailing whitespace)
                  " gg" ;git-gutter-mode
                  " hl-s" ;highlight-symbol-mode
                  " hlt" ;highlight-thing
                  " hs" ;hideshow
                  " ing" ;indent-guide-mode
                  " ivy" ;ivy-mode (swiper, counsel and friends)
                  " pair" ;autopair
                  " rt" ;ruby-tools-mode
                  " yas";yas-minor-mode aka yasnippet
                  )))

;; (add-hook 'after-init-hook 'myinit-rich-minority)
;; (defun myinit-rich-minority () "My init.")

;;; init-rich-minority.el ends here
