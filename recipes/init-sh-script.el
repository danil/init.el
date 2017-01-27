;;; init-sh-script.el --- This file is part of Danil <danil@kutkevich.org> home.

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

(add-hook 'after-init-hook 'myinit-sh-script)

(defun myinit-sh-script ()
  "My init."

  (myinit-add-mode-to-patterns 'shell-script-mode
                               "/Procfile\\'"
                               "/\\.ackrc\\'"
                               "/\\.bash_aliases\\'"
                               "/\\.bpkgrc\\'"
                               "/\\.env\\(\\.development\\|\.production\\)?\\(\\.example\\)?\\'"
                               "/\\.lessfilter\\'"
                               "/\\.mkshrc\\'"
                               "/\\.xprofile\\'"
                               "/dwmrc\\'")

  ;; Gentoo.
  (myinit-add-mode-to-patterns 'shell-script-mode
                               "/etc/init.d/"
                               "/etc/local.d/.+\\.\\(start\\|stop\\)"))

(defun myinit-sh-mode--rainbow-identifiers-init ()
  (when (equal major-mode 'sh-mode)
    (make-local-variable 'rainbow-identifiers-filter-functions)
    (add-hook 'rainbow-identifiers-filter-functions
              'rainbow-identifiers-face-overridable)
    (add-hook 'rainbow-identifiers-filter-functions
              'myinit-sh-mode--rainbow-identifiers-filter)

    (make-local-variable 'rainbow-identifiers-faces-to-override)
    (setq rainbow-identifiers-faces-to-override '(
                                                  font-lock-string-face
                                                  font-lock-variable-name-face
                                                  sh-heredoc
                                                  sh-quoted-exec
                                                  ))

    (rainbow-identifiers-mode)))

;; <http://amitp.blogspot.ru/2014/09/emacs-rainbow-identifiers-customized.html>.
(defun myinit-sh-mode--rainbow-identifiers-filter (beg end)
  (let ((current-identifier (buffer-substring-no-properties beg end))
        (ch-after (char-after end))
        (ch-before (char-before beg))
        (ch2-before (buffer-substring-no-properties
                     (max (point-min) (- beg 2)) beg))
        (str-after (buffer-substring-no-properties end (point-max))))
    (and
     (string-match-p "\\`[a-zA-Z_\x7f-\xff][a-zA-Z0-9_\x7f-\xff]*\\'"
                     current-identifier)
     (or (and
          (member ch2-before '(?$ "${"))
          ;; (string-match-p "\\`[^}]*}" str-after)
          (equal ch-after ?}))
         (equal ch-before ?$)
         (string-match-p "\\`[[:space:]]*[/*+-]?=" str-after)))))

;;; init-sh-script.el ends here
