;;; init-counsel-auto-complete.el --- This file is part of Danil <https://danil.kutkevich.org> home.

;; Copyright (C) 2021 Danil <https://danil.kutkevich.org>.
;; Author: Danil <https://danil.kutkevich.org>
;; Maintainer: Danil <https://danil.kutkevich.org>
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

;; (require 'dabbrev)
;; (add-hook 'after-init-hook 'noxrcp-counsel-auto-complete)
;; (defun noxrcp-counsel-auto-complete ()
;;   "No X recipe init."
;;   ;; (dolist (pattern noxrcp-counsel-auto-complete-patterns)
;;   ;;   (add-to-list 'auto-mode-alist (cons pattern 'counsel-auto-complete)))
;;   ;; (if (boundp 'counsel-auto-complete) (noxrcp-counsel-auto-complete--init)
;;   ;;   (with-eval-after-load 'counsel-auto-complete (noxrcp-counsel-auto-complete--init)))
;;   )

;; ;; (defun noxrcp-counsel-auto-complete--init ())

;; ;; <https://emacs.stackexchange.com/questions/30690/code-auto-completion-with-ivy>.
;; (defun noxrcp-counsel-auto-complete--complete ()
;;   (interactive)
;;   (dabbrev--reset-global-variables)
;;   (let* ((abbrev (dabbrev--abbrev-at-point))
;;          (candidates (dabbrev--find-all-expansions abbrev t)))
;;     (when (not (null candidates))
;;       (let* ((found-match (ivy-read "matches " candidates
;;                                 :preselect (thing-at-point 'word)
;;                                 :sort t))
;;             (abbrev-length (length abbrev)))
;;         (insert (substring found-match abbrev-length))))))
;; ;; (defun noxrcp-counsel-auto-complete--complete ()
;; ;;   (dabbrev--reset-global-variables)
;; ;;   (let* ((abbrev (dabbrev--abbrev-at-point))
;; ;;          (candidates (dabbrev--find-all-expansions abbrev t))
;; ;;          (bnd (bounds-of-thing-at-point 'symbol)))
;; ;;     (list (car bnd) (cdr bnd) candidates)))
;; ;; (add-to-list 'completion-at-point-functions 'noxrcp-counsel-auto-complete--complete)

;;; init-counsel-auto-complete.el ends here
