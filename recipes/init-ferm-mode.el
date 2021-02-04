;;; init-ferm-mode.el --- This file is part of Danil <https://danil.kutkevich.org> home.

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

(autoload 'ferm-mode "ferm-mode" nil t)

(defcustom noxrcp-ferm-mode-patterns '()
  "Regexp patterns associated with `ferm-mode'."
  :group 'noxinit)


(defcustom noxrcp-ferm-mode--rainbow-identifiers-stop-words '()
  "Do not highlight in `ferm-mode'."
  :group 'noxinit)

(custom-set-variables
 '(noxrcp-ferm-mode-patterns '("/etc/iptables/rules.v[46]"
                               "\\.rules\\'"))
 '(noxrcp-ferm-mode--rainbow-identifiers-stop-words
   '(
     "ACCEPT"
     "DROP"
     "FORWARD"
     "INPUT"
     "OUTPUT"
     "REJECT"
     )))

(add-hook 'after-init-hook 'noxrcp-ferm-mode)

(defun noxrcp-ferm-mode ()
  "No X recipe init."
  (dolist (pattern noxrcp-ferm-mode-patterns)
    (add-to-list 'auto-mode-alist (cons pattern 'ferm-mode))))

(defun init-ferm-mode-rainbow-identifiers-setup ()
  (when (equal major-mode 'ferm-mode)
    (make-local-variable 'rainbow-identifiers-filter-functions)
    (add-hook 'rainbow-identifiers-filter-functions
              'noxrcp-ferm-mode--rainbow-identifiers-filter)
    (init-rainbow-identifiers--lazy-setup)))

;; <http://amitp.blogspot.ru/2014/09/emacs-rainbow-identifiers-customized.html>.
(defun noxrcp-ferm-mode--rainbow-identifiers-filter (beg end)
  "My rainbow-identifiers custom init for symbol between `BEG' and `END'."
  (let ((face-cur (or (get-char-property beg 'read-face-name)
                      (get-char-property beg 'face)))
        (ch-cur (char-after beg))
        (str-cur (buffer-substring-no-properties beg end)))
    (and
     (or
      ;; (eq face-cur 'font-lock-preprocessor-face)
      (eq face-cur nil))
     (not (member str-cur noxrcp-ferm-mode--rainbow-identifiers-stop-words)))))

;;; init-ferm-mode.el ends here
