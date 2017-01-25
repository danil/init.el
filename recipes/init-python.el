;;; init-python.el --- This file is part of Danil <danil@kutkevich.org> home.

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

(add-hook 'after-init-hook 'myinit-python)

(defun myinit-python ()
  "My init."

  ;; (myinit-after-load 'python
  ;;   (define-key python-mode-map (kbd "C-c C-f") nil))

  (add-hook 'rainbow-identifiers-filter-functions
            'myinit-python--rainbow-identifiers-filter)

  (myinit-add-mode-to-patterns 'python-mode "/requirements\\.txt\\'"))

;; <http://amitp.blogspot.ru/2014/09/emacs-rainbow-identifiers-customized.html>.
(defun myinit-python--rainbow-identifiers-filter (beg end)
  (if (not (equal major-mode 'python-mode))
      (rainbow-identifiers-face-overridable beg end)
    (and
     (rainbow-identifiers-face-overridable beg end)
     (let* ((ch-current (char-after beg))
            (ch-before (char-before beg))
            (ch-after (char-after end))
            (current-identifier (buffer-substring-no-properties beg end))
            (str-before (buffer-substring-no-properties (point-min) beg))
            (str-after (buffer-substring-no-properties end (point-max))))
       (and (not (member ch-current
                         '(?0 ?1 ?2 ?3 ?4 ?5 ?6 ?7 ?8 ?9 ?? ?_)))
            (not (string-match-p "[?!]\\'" current-identifier))
            (not (and (string-match-p "^[[:space:]]*\\'" str-before)
                      (string-match-p "\\`[[:space:]]*$" str-after)))
            (not (string-match-p "\\(self\\|super\\)[[:space:]\n]*\\.[[:space:]\n]*\\'"
                                 str-before))
            (not (equal ch-after ?\())
            (not (string-match-p "\\`[[:space:]]+:[^[:space:]]" str-after))
            (not (and (string-match-p "\\`[[:space:]]+[^=!,/*?&#|:<>{}+-]" str-after)
                     (not (string-match-p "\\`[[:space:]]+\\(if\\|unless\\)" str-after))))
            (or (not (and (equal ch-before ?\.) (equal ch-after ?\.)))
                (string-match-p "\\`\\.[[:space:]\n]*\\(new\\)[^a-zA-Z0-1]"
                                str-after))
            (not (member current-identifier '(
                                              "new"
                                              ))))))))

;;; init-python.el ends here
