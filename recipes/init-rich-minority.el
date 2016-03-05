;;; init-rich-minority.el --- This file is part of Danil <danil@kutkevich.org> home.

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

(custom-set-variables
 '(rm-blacklist '(
                  " hl-p"

                  " ," ;wtf!???
                  " AC" ;auto-complete-mode
                  " ARev" ;auto-revert-mode
                  " Abbrev" ;abbrev-mode
                  " Anzu" ;anzu-mode
                  " Helm" ;helm-mode
                  " MRev" ;magit-auto-revert-mode
                  " Rails" ;projectile-rails
                  " Rbow" ;rainbow-mode
                  " RubyRef" ;ruby-refactor-mode
                  " SP" ;smartparens-mode
                  " Undo-Tree" ;undo-tree-mode
                  " end" ;ruby-end-mode
                  " ew:mnl" ;ethan-wspace find NO errors in Makefile, C or Go sources
                  " ew:mnlt" ;ethan-wspace find NO errors (highlight trailing whitespace)
                  " gg" ;git-gutter-mode
                  " hl-s" ;highlight-symbol-mode
                  " hs" ;hideshow
                  " ing" ;indent-guide-mode
                  " pair" ;autopair
                  " rt" ;ruby-tools-mode
                  " yas";yas-minor-mode aka yasnippet
                  ))

 '(rm-text-properties '(
                        ("\\` Ovwrt\\'" 'face 'font-lock-warning-face)

                        ("\\` Compiling\\'" 'display " C*") ;∞ U+221E infin or infinity
                        ("\\` FlyC!\\'" 'display " F!") ;flycheck-mode: The syntax check failed. Inspect the ‘*Messages*’ buffer for more information about the failure.
                        ("\\` FlyC*\\'" 'display " F*") ;flycheck-mode: flycheck currently checks the current buffer
                        ("\\` FlyC-\\'" 'display " F-") ;flycheck-mode: Flycheck did not find any syntax checker for the current buffer. Try C-c ! v (flycheck-verify-setup) to find out why.
                        ("\\` FlyC\?\\'" 'display " F?") ;flycheck-mode: The syntax check had a dubious result. The definition of the syntax checker may be flawed. Inspect the ‘*Messages*’ buffer for details.
                        ("\\` FlyC\\'" 'display " F") ;flycheck-mode: there are no errors in the current buffer
                        ("\\`↑\\'" 'display " M") ;modalka-mode
                        ;; ("\\` FlyC:3/5\\'" 'display " ") ;flycheck-mode: there are three errors and five warnings in the current buffer
                        ;; ("\\` Less\\'" 'face 'font-lock-warning-face)
                        )))

;;; init-rich-minority.el ends here
