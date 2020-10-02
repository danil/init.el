;;; init-systemd.el --- This file is part of Danil <danil@kutkevich.org> home.

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

(defcustom noxrcp-systemd-patterns '()
  "Regexp patterns associated with `systemd'."
  :group 'noxrcp)

(defcustom noxrcp-systemd--rainbow-identifiers-stop-words '()
  "Do not highlight in `systemd'."
  :group 'noxrcp)

(custom-set-variables
 '(noxrcp-systemd-patterns '())
 '(noxrcp-systemd--rainbow-identifiers-stop-words '()))

;; (add-hook 'after-init-hook 'noxrcp-systemd)
;; (defun noxrcp-systemd ()
;;   "No X recipe init."
;;   (dolist (pattern noxrcp-systemd-patterns)
;;     (add-to-list 'auto-mode-alist (cons pattern 'systemd-mode)))
;;   (if (boundp 'systemd) (noxrcp-systemd--setup)
;;     (with-eval-after-load 'systemd (noxrcp-systemd--setup))))
;; (defun noxrcp-systemd--setup ())

(defun noxrcp-systemd--rainbow-identifiers-init ()
  (when (equal major-mode 'systemd)
    (make-local-variable 'rainbow-identifiers-filter-functions)
    (add-hook 'rainbow-identifiers-filter-functions
              'rainbow-identifiers-face-overridable)
    (add-hook 'rainbow-identifiers-filter-functions
              'noxrcp-systemd--rainbow-identifiers-filter)
    (make-local-variable 'rainbow-identifiers-faces-to-override)
    (setq rainbow-identifiers-faces-to-override '(font-lock-keyword-face))
    (noxrcp-rainbow-identifiers--lazyinit)))

;; <http://amitp.blogspot.ru/2014/09/emacs-rainbow-identifiers-customized.html>.
(defun noxrcp-systemd--rainbow-identifiers-filter (beg end)
  "My rainbow-identifiers custom init for symbol between `BEG' and `END'."
  (let (;; (ch-cur (char-after beg))
        ;; (ch-before (char-before beg))
        ;; (ch-after (char-after end))
        (str-cur (buffer-substring-no-properties beg end))
        ;; (str-before (buffer-substring-no-properties (point-min) beg))
        ;; (str-after (buffer-substring-no-properties end (point-max)))
        )
    (and ;; (not (member ch-cur '(?0 ?1 ?2 ?3 ?4 ?5 ?6 ?7 ?8 ?9 ??)))
         (not (member str-cur noxrcp-systemd--rainbow-identifiers-stop-words)))))

;;; init-systemd.el ends here
