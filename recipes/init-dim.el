;;; init-dim.el --- This file is part of Danil <danil@kutkevich.org> home.

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

(add-hook 'after-init-hook 'noxrcp-dim)
(defun noxrcp-dim ()
  "My init."
  (dim-major-names
   '(
     (clojure-mode "clj")
     (go-mode "go")
     (emacs-lisp-mode "el")
     (js-mode "js")
     (js2-mode "js2")
     (markdown-mode "md")
     (python-mode "py")
     (sh-mode "sh")
     ))
  ;; (noxrcp-run-with-idle-timer-in-current-buffer
  ;;  noxrcp-default-idle-timer-seconds nil 'noxrcp-dim--lazy)
  )

;; (defun noxrcp-dim--lazy ()
;;   (dim-minor-names
;;    '(
;;      ;; (???   "") ; " hl-p"
;;      ;; (???   "") ; " ," ; wtf!???
;;      (aggressive-indent "") ; " =>" ; aggressive-indent
;;      (auto-complete-mode "") ; " AC" ; auto-complete-mode
;;      (auto-revert-mode "") ; " ARev" ;
;;      (abbrev-mode "") ; " Abbrev" ; abbrev-mode
;;      (anzu-mode "") ; " Anzu" ; anzu-mode
;;      (helm-mode "") ; " Helm" ; helm-mode
;;      (isearch-mode "") ; " Isearch" ; isearch-mode
;;      (magit-auto-revert-mode "") ; " MRev" ; magit-auto-revert-mode
;;      (noxrcp-mode "") ; " Noxrcp" ; noxrcp-mode
;;      (projectile-rails "") ; " Rails" ; projectile-rails
;;      (rainbow-mode "") ; " Rbow" ; rainbow-mode
;;      (ruby-refactor-mode "") ; " RubyRef" ; ruby-refactor-mode
;;      (smartparens-mode "") ; " SP" ; smartparens-mode
;;      (undo-tree-mode "") ; " Undo-Tree" ; undo-tree-mode
;;      (ruby-end-mode "") ; " end" ; ruby-end-mode
;;      (ethan-wspace "") ; " ew:mnl" ; ethan-wspace find NO errors in Makefile, C or Go sources ; " ew:mnlt" ; ethan-wspace find NO errors (highlight trailing whitespace)
;;      (git-gutter-mode "") ; " gg" ; git-gutter-mode
;;      (highlight-symbol-mode "") ; " hl-s" ; highlight-symbol-mode
;;      (highlight-thing "") ; " hlt" ; highlight-thing
;;      (hideshow "") ; " hs" ; hideshow
;;      (indent-guide-mode "") ; " ing" ; indent-guide-mode
;;      (ivy-mode "") ; " ivy" ; ivy-mode (swiper, counsel and friends)
;;      (autopair "") ; " pair" ; autopair
;;      (ruby-tools-mode "") ; " rt" ; ruby-tools-mode
;;      (yas-minor-mode "") ; " yas" ; yas-minor-mode aka yasnippet
;;      )))

;;; init-dim.el ends here
