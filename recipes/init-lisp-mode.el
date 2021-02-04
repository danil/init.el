;;; init-lisp-mode.el --- This file is part of Danil <https://danil.kutkevich.org> home.

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

(defcustom noxrcp-lisp-mode-patterns '()
  "Regexp patterns associated with `lisp-mode'."
  :group 'noxinit)

(custom-set-variables '(noxrcp-lisp-mode-patterns '(
                                                    "/\\.stumpwmrc\\'"
                                                    "/\\.sbclrc\\'"
                                                    "\\.ros\\'"
                                                    "\\.sexp\\'"
                                                    )))

(add-hook 'after-init-hook 'noxrcp-lisp-mode)
(defun noxrcp-lisp-mode ()
  "No X recipe init."
  (dolist (pattern noxrcp-lisp-mode-patterns)
    (add-to-list 'auto-mode-alist (cons pattern 'lisp-mode)))
  (if (boundp 'lisp-mode-map) (noxrcp-lisp-mode--setup)
    (with-eval-after-load 'lisp-mode (noxrcp-lisp-mode--setup))))

(defun noxrcp-lisp-mode--setup ()
  ;; (init-lazy
  ;;  init-lazy-seconds nil 'noxrcp-lisp-mode--lazy-setup)
  (define-key lisp-mode-map (kbd "C-c C-f n") 'beginning-of-defun)
  (define-key lisp-mode-map [?\C-\M-i] nil))

;; (defun noxrcp-lisp-mode--lazy-setup ()
;;   (let ((f "~/.roswell/helper.el"))
;;     (when (file-exists-p f)
;;       (load (expand-file-name f))
;;       (setq inferior-lisp-program "ros -Q run"))))

(defun init-lisp-mode-rainbow-identifiers-setup ()
  (when (equal major-mode 'lisp-mode)
    (make-local-variable 'rainbow-identifiers-filter-functions)
    (add-hook 'rainbow-identifiers-filter-functions
              'noxrcp-lisp-mode--rainbow-identifiers-filter)

    (init-rainbow-identifiers--lazy-setup)))

(defun noxrcp-lisp-mode--rainbow-identifiers-filter (beg end)
  "My rainbow-identifiers custom init for symbol between `BEG' and `END'."

  (let ((face-cur (or (get-char-property beg 'read-face-name)
                      (get-char-property beg 'face)))
        (ch-cur (char-after beg))
        (str-cur (buffer-substring-no-properties beg end)))
    (and
     (member face-cur '(nil font-lock-function-name-face
                            font-lock-builtin-face
                            font-lock-variable-name-face))
     (not (member ch-cur
                  '(?% ?* ?+ ?- ?/ ?0 ?1 ?2 ?3 ?4 ?5 ?6 ?7 ?8 ?9 ?< ?< ?= ?> ?? ?_ ?` ?.)))
     (not (member str-cur '( ;this is standard functions
                            "nil"
                            ))))))

;;; init-lisp-mode.el ends here
