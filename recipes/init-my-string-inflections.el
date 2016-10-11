;;; init-my-string-inflections.el --- This file is part of Danil <danil@kutkevich.org> home.

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

(add-hook 'after-init-hook 'myinit-my-string-inflections)

(defun myinit-my-string-inflections ()
  "My init."

  (define-key myinit-map (kbd "c i") 'my-toggle-camelcase-and-underscore)
  (define-key myinit-map (kbd "c I") 'my-humanize-symbol))

;;; CamleCase and underscore inflection toggle
;;; <http://superuser.com/questions/126431/is-there-any-way-to-convert-camel-cased-names-to-use-underscores-in-emacs/126473#300048>,
;;; <https://bunkus.org/blog/2009/12/switching-identifier-naming-style-between-camel-case-and-c-style-in-emacs>,
;;; <http://api.rubyonrails.org/classes/ActiveSupport/Inflector.html>.
(defun my-toggle-camelcase-and-underscore ()
  "Toggles the symbol at point between C-style naming,
e.g. `hello_world_string', and camel case,
e.g. `HelloWorldString'."
  (interactive)

  (let* ((symbol-pos (bounds-of-thing-at-point 'symbol))
         case-fold-search symbol-at-point cstyle regexp func)
    (unless symbol-pos
      (error "No symbol at point"))
    (save-excursion
      (narrow-to-region (car symbol-pos) (cdr symbol-pos))
      (setq cstyle (string-match-p "_" (buffer-string))
            regexp (if cstyle "\\(?:\\_<\\|_\\)\\(\\w\\)" "\\([A-Z]\\)")
            func (if cstyle
                     'capitalize
                   (lambda (s)
                     (concat (if (= (match-beginning 1)
                                    (car symbol-pos))
                                 ""
                               "_")
                             (downcase s)))))
      (goto-char (point-min))
      (while (re-search-forward regexp nil t)
        (replace-match (funcall func (match-string 1))
                       t nil))
      (widen))))

(defun my-humanize-symbol ()
  "Humanize the symbol at point from
C-style naming, e.g. `hello_world_string',
and camel case, e.g. `HelloWorldString',
and Lisp-style nameing, e.g. `hello-world-string'."
  (interactive)
  (let* ((symbol-pos (bounds-of-thing-at-point 'symbol))
         case-fold-search symbol-at-point cstyle regexp func)
    (unless symbol-pos
      (error "No symbol at point"))
    (save-excursion
      (narrow-to-region (car symbol-pos) (cdr symbol-pos))
      (setq cstyle (string-match-p "_" (buffer-string))
            lisp-style (string-match-p "-" (buffer-string))
            regexp (cond (cstyle "\\(?:\\_<\\|_\\)\\(\\w\\)")
                         (lisp-style "\\(?:\\-<\\|-\\)\\(\\w\\)")
                         (t "\\([A-Z]\\)"))
            func (lambda (s)
                   (concat (if (= (match-beginning 1)
                                  (car symbol-pos))
                               ""
                             " ")
                           (downcase s))))
      (goto-char (point-min))
      (while (re-search-forward regexp nil t)
        (replace-match (funcall func (match-string 1))
                       t nil))
      (widen))))

;;; init-my-string-inflections.el ends here
