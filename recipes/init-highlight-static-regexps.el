;;; init-highlight-static-regexps.el --- This file is part of Danil <https://danil.kutkevich.org> home.

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

(defcustom noxrcp-highlight-static-regexps-hooks '()
  "Hooks associated with `highlight-static-regexps'."
  :group 'noxinit)

(custom-set-variables
 '(noxrcp-highlight-static-regexps-hooks
   '(
     (go-mode-hook noxrcp-go-mode--highlight-static-regexps-init)
     ;; (ruby-mode-hook noxrcp-ruby-mode--highlight-static-regexps-init)
     )))

(add-hook 'after-init-hook 'noxrcp-highlight-static-regexps)

(defun noxrcp-highlight-static-regexps ()
  "No X recipe init."
  (dolist (hook noxrcp-highlight-static-regexps-hooks)
    (let ((h (car hook))
          (init-fn (nth 1 hook)))
      (when (fboundp init-fn) (add-hook h init-fn))))
  (let ((f (lambda ()
             (setq highlight-static-regexps-choose-face-function
                   'noxrcp-go-mode--highlight-static-regexps-choose-face))))
    (if (boundp 'highlight-static-regexps-choose-face-function) (funcall f)
      (with-eval-after-load 'highlight-static-regexps (funcall f)))))

;; (defcustom highlight-static-regexps-keyword-faces
;;   '(("foo" . "#red")
;;     ("bar" . "#green"))
;;   "Faces used to highlight specific keywords."
;;   :group 'noxinit
;;   :type '(repeat (cons (string :tag "Keyword")
;;                        (choice :tag "Face   "
;;                                (string :tag "Color")
;;                                (sexp :tag "Face"))))
;;   ;; :set (lambda (symbol value)
;;   ;;        (set-default symbol value)
;;   ;;        (hl-todo-set-regexp))
;;   )

(defun noxrcp-go-mode--highlight-static-regexps-choose-face (s)
  (cond
   ((equal s "unsafe") '(:weight bold))
   ((equal s " :=") '(:weight bold))
   ((equal s ") (") '(:weight bold))
   ((equal s "\tbreak") '(:inherit font-lock-keyword-face :weight bold))
   ((equal s "\tcontinue") '(:inherit font-lock-keyword-face :weight bold))
   ((equal s "\tdefer") '(:inherit font-lock-keyword-face :weight bold))
   ((equal s "\tgo") '(:inherit font-lock-keyword-face :weight bold))
   ((equal s "\tgoto") '(:inherit font-lock-keyword-face :weight bold))
   ((equal s "\treturn") '(:inherit font-lock-keyword-face :weight bold))
   (t '(:inherit init-alert))))

(defun noxrcp-highlight-static-regexps--lazyinit ()
  "Run `highlight-static-regexps'."

  (init-lazy
   init-lazy-seconds nil 'highlight-static-regexps-mode))

(defun noxrcp-highlight-static-regexps--face-overridable (begin end)
  "My test if the face of the identifier under BEGIN is overridable."
  (let ((face (get-text-property begin 'face)))
    (cond
     ((null face)
      nil)
     ((listp face)
      (catch 'highlight-static-regexps--face-overridable
        (dolist (face* face)
          (unless (memq face* highlight-static-regexps-faces-to-override)
            (throw 'highlight-static-regexps--face-overridable nil)))
        t))
     (t
      (memq face highlight-static-regexps-faces-to-override)))))

;;; init-highlight-static-regexps.el ends here
