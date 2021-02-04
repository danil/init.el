;;; init-python.el --- This file is part of Danil <https://danil.kutkevich.org> home.

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

(add-hook 'after-init-hook 'noxrcp-python)

(defun noxrcp-python ()
  "No X recipe init."

  (noxrcp-add-mode-to-patterns 'python-mode "/requirements\\.txt\\'"))

(defun init-python-mode-rainbow-identifiers-setup ()
  (when (equal major-mode 'python-mode)
    (make-local-variable 'rainbow-identifiers-filter-functions)
    (add-hook 'rainbow-identifiers-filter-functions
              'rainbow-identifiers-face-overridable)
    (add-hook 'rainbow-identifiers-filter-functions
              'noxrcp-python-mode--rainbow-identifiers-filter)

    (make-local-variable 'rainbow-identifiers-faces-to-override)
    (setq rainbow-identifiers-faces-to-override '(font-lock-variable-name-face))

    (init-rainbow-identifiers--lazy-setup)))

;; <http://amitp.blogspot.ru/2014/09/emacs-rainbow-identifiers-customized.html>.
(defun noxrcp-python-mode--rainbow-identifiers-filter (beg end)
  "My rainbow-identifiers custom init for symbol between `BEG' and `END'."

  (let ((ch-cur (char-after beg))
        (ch-before (char-before beg))
        (ch-after (char-after end))
        (str-cur (buffer-substring-no-properties beg end))
        (str-before (buffer-substring-no-properties (point-min) beg))
        (str-after (buffer-substring-no-properties end (point-max))))
    (and (not (member ch-cur
                      '(?0 ?1 ?2 ?3 ?4 ?5 ?6 ?7 ?8 ?9 ??)))
         (not (string-match-p "[?!]\\'" str-cur))
         (not (string-match-p "__" str-cur))
         (not (equal ch-after ?\())
         (or (not (equal ch-before ?\s))
             (not (string-match-p "\\(import\\|from\\) \\'" str-before)))
         (or (not (equal ch-after ?\s))
             (not (string-match-p "\\` import" str-after)))
         (not (and (string-match-p "^[[:space:]]*\\'" str-before)
                   (string-match-p "\\`[[:space:]]*$" str-after)))
         (not (string-match-p "\\`[[:space:]]+:[^[:space:]]" str-after))
         (or (not (and (equal ch-before ?\.) (equal ch-after ?\.)))
             (string-match-p "\\`\\.[[:space:]\n]*\\(new\\)[^a-zA-Z0-1]"
                             str-after))
         (not (member str-cur '(
                                "new"
                                ))))))

;;; init-python.el ends here
