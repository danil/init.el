;;; init-slim-mode.el --- This file is part of Danil <danil@kutkevich.org> home.

;; Copyright (C) 2018 Danil <danil@kutkevich.org>.
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

(add-hook 'after-init-hook 'myinit-slim-mode)
(defun myinit-slim-mode ()
  "My init."
  (myinit-after-load 'slim-mode
    (define-key slim-mode-map (kbd "\C-c\C-f") nil)
    (define-key slim-mode-map (kbd "M-_") nil)
    (define-key slim-mode-map (kbd "M-?") nil)
    (define-key slime-parent-map (kbd "M-_") nil)
    (define-key slime-parent-map (kbd "M-?") nil)))

(defun myinit-slim-mode--rainbow-identifiers-init ()
  (when (equal major-mode 'slim-mode)
    (make-local-variable 'rainbow-identifiers-filter-functions)
    (add-hook 'rainbow-identifiers-filter-functions
              'rainbow-identifiers-face-overridable)
    (add-hook 'rainbow-identifiers-filter-functions
              'myinit-slim-mode--rainbow-identifiers-filter)
    (make-local-variable 'rainbow-identifiers-faces-to-override)
    (setq rainbow-identifiers-faces-to-override '(
                                                  font-lock-type-face
                                                  font-lock-variable-name-face
                                                  font-lock-function-name-face
                                                  font-lock-constant-face
                                                  ))
    (myinit-rainbow-identifiers--lazyinit)))

;; <http://amitp.blogspot.ru/2014/09/emacs-rainbow-identifiers-customized.html>.
(defun myinit-slim-mode--rainbow-identifiers-filter (beg end)
  "My rainbow-identifiers custom init for symbol between `BEG' and `END'."

  (let ((ch-cur (char-after beg))
        (ch-before (char-before beg))
        (ch-after (char-after end))
        (str-cur (buffer-substring-no-properties beg end))
        (str-before (buffer-substring-no-properties (point-min) beg))
        (str-after (buffer-substring-no-properties end (point-max))))
    (and (not (member ch-cur '(?0 ?1 ?2 ?3 ?4 ?5 ?6 ?7 ?8 ?9 ?? ?_ ?- ?| ?=)))
         ;; (not (string-match-p "[?!]\\'" str-cur))
         ;; (not (and (string-match-p "^[[:space:]]*\\'" str-before)
         ;;           (string-match-p "\\`[[:space:]]*$" str-after)))
         ;; (not (string-match-p "\\(self\\|super\\)[[:space:]\n]*\\.[[:space:]\n]*\\'"
         ;;                      str-before))
         ;; (not (equal ch-after ?\())
         ;; (not (string-match-p "\\`[[:space:]]+:[^[:space:]]" str-after))
         ;; (not (and (string-match-p "\\`[[:space:]]+[^=!,/*?&#|:<>{}+-]" str-after)
         ;;           (not (string-match-p "\\`[[:space:]]+\\(if\\|unless\\)" str-after))))
         ;; (not (string-match-p "\\`[[:space:]\n]+\\({\\|do\\)[^a-zA-Z]" str-after))
         ;; (or (not (and (equal ch-before ?\.) (equal ch-after ?\.)))
         ;;     (string-match-p "\\`\\.[[:space:]\n]*\\(blank\\?\\|count\\|first\\|join\\|last\\|extract_options!\\|length\\|new\\|pop\\|present\\?\\|nil\\?\\|save!?\\|scoped\\|second\\|size\\|split\\|to_a\\|to_h\\|to_i\\|to_s\\|upcase\\|update_all\\)[^a-zA-Z0-1]"
         ;;                     str-after))
         (not (member str-cur '(
                                "else"
                                "elsif"
                                "end"
                                "if"
                                "render"
                                "ruby"
                                ))))))

;;; init-slim-mode.el ends here
