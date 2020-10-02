;;; init-diff-hl.el --- This file is part of Danil <danil@kutkevich.org> home.

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
 '(diff-hl-margin-symbols-alist '(
                                  (change . " ") ;"="
                                  (delete . " ") ;"-"
                                  (ignored . " ") ;"!"
                                  (insert . " ") ;"+"
                                  (unknown . " ") ;"?"
                                  ))
 '(diff-hl-draw-borders nil)
 '(diff-hl-side 'right))

;; (add-hook 'after-init-hook 'noxrcp-diff-hl)
;; (defun noxrcp-diff-hl ()
;;   "No X recipe init."
;;   ;; (with-eval-after-load 'diff-hl)
;;   ;; (define-key noxrcp-map (kbd "x v") 'noxrcp-diff-hl-toggle)
;;   (dolist (hook noxrcp-programming-modes-hooks)
;;     (add-hook hook 'noxrcp-diff-hl--lazyinit)))

(defun noxrcp-diff-hl--init (myarg)
  "Run `diff-hl'."
  (when (and
         (fboundp 'noxrcp-diff-hl--setup)
         (fboundp 'diff-hl-mode)
         (fboundp 'diff-hl-margin-mode))
    (diff-hl-margin-mode myarg)
    (diff-hl-mode myarg)
    (noxrcp-diff-hl--setup myarg)))

(defun noxrcp-diff-hl--setup (myarg)
  "Init/setup or teardown/deinit `diff-hl'."
  (if myarg (noxrcp-diff-hl---setup) (noxrcp-diff-hl---teardown)))

(defun noxrcp-diff-hl---setup ()
  "Init/setup `diff-hl'."
     (add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh)
     ;; (custom-set-faces
     ;;  '(diff-hl-insert ((((class color) (min-colors 88) (background dark)) (:background "magenta" :foreground "magenta")))))
     (when (equal frame-background-mode 'dark)
       ;; (set-face-attribute 'diff-hl-insert nil :inherit 'diff-added
       ;;                     :foreground "green" :background "black")
       (set-face-attribute 'diff-hl-insert nil :inherit 'diff-header) ;diff-added
       ;; (set-face-attribute 'diff-hl-change nil :inherit 'diff-changed
       ;;                     :foreground "brightblue" :background "black")
       (set-face-attribute 'diff-hl-change nil :inherit 'diff-header) ;diff-changed
       ;; (set-face-attribute 'diff-hl-delete nil :inherit 'diff-removed
       ;;                     :foreground "brightred" :background "black")
       (set-face-attribute 'diff-hl-delete nil :inherit 'diff-removed)))

(defun noxrcp-diff-hl---teardown ()
  "Teardown/deinit `diff-hl'."
  (remove-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh))

;; (defun noxrcp-diff-hl-toggle ()
;;   "Toggle the `diff-hl-mode'."
;;   (interactive)
;;   (let ((g (lambda (x) (when (fboundp 'diff-hl-mode) (diff-hl-mode x)))))
;;     (cond ((and (boundp 'diff-hl-mode) (equal diff-hl-mode t))
;;            (funcall g -1))
;;           (t
;;            (funcall g t)))))

;;; init-diff-hl.el ends here
