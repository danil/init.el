;;; init-lisp-mode.el --- This file is part of Danil <danil@kutkevich.org> home.

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

(add-hook 'after-init-hook 'myinit-lisp-mode)
(defun myinit-lisp-mode ()
  "My init."
  (dolist (pattern '("/\\.stumpwmrc\\'" "/\\.sbclrc\\'"))
    (add-to-list 'auto-mode-alist (cons pattern 'lisp-mode)))
  (if (boundp 'lisp-mode-map) (myinit-lisp-mode--setup)
    (with-eval-after-load 'lisp-mode (myinit-lisp-mode--setup))))

(defun myinit-lisp-mode--setup ()
  (define-key lisp-mode-map (kbd "C-c C-f n") 'beginning-of-defun)
  (define-key lisp-mode-map [?\C-\M-i] nil))

(defun myinit-lisp-mode--rainbow-identifiers-init ()
  (when (equal major-mode 'lisp-mode)
    (make-local-variable 'rainbow-identifiers-filter-functions)
    (add-hook 'rainbow-identifiers-filter-functions
              'myinit-lisp-mode--rainbow-identifiers-filter)

    (myinit-rainbow-identifiers--lazyinit)))

(defun myinit-lisp-mode--rainbow-identifiers-filter (beg end)
  "My rainbow-identifiers custom init for symbol between `BEG' and `END'."

  (let ((face-cur (or (get-char-property beg 'read-face-name)
                      (get-char-property beg 'face)))
        (ch-cur (char-after beg))
        (str-cur (buffer-substring-no-properties beg end)))
    (and
     (member face-cur '(nil font-lock-function-name-face font-lock-variable-name-face))
     (not (member ch-cur
                  '(?% ?* ?+ ?- ?/ ?0 ?1 ?2 ?3 ?4 ?5 ?6 ?7 ?8 ?9 ?< ?< ?= ?> ?? ?_ ?` ?.)))
     (not (member str-cur '( ;this is standard functions
                            "foobar!!!!!!!!!!!!!!!!"
                            ))))))

;;; init-lisp-mode.el ends here
