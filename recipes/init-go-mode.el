;;; init-go-mode.el --- This file is part of Danil <danil@kutkevich.org> home.

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

(custom-set-variables '(gofmt-command "goimports")) ; The 'gofmt' command. Some users may replace this with 'goimports'from https://github.com/bradfitz/goimports.

(add-hook 'after-init-hook 'myinit-go-mode)

(defun myinit-go-mode ()
  "My init."

  (add-hook 'rainbow-identifiers-filter-functions
            'myinit-go-mode--rainbow-identifiers-filter)

  (myinit-after-load 'go-mode
    (add-hook 'before-save-hook #'gofmt-before-save)

    (define-key go-mode-map (my-kbd "? ? f") 'godoc-at-point)))

;; <http://amitp.blogspot.ru/2014/09/emacs-rainbow-identifiers-customized.html>.
(defun myinit-go-mode--rainbow-identifiers-filter (beg end)
  (if (not (equal major-mode 'go-mode))
      (rainbow-identifiers-face-overridable beg end)
    (and
     (rainbow-identifiers-face-overridable beg end)
     (let* ((ch-current (char-after beg))
            ;; (ch-before (char-before beg))
            (ch-after (char-after end))
            (current-identifier (buffer-substring-no-properties beg end))
            (str-after (buffer-substring-no-properties end (point-max))))
       (and (not (member ch-current
                         '(?0 ?1 ?2 ?3 ?4 ?5 ?6 ?7 ?8 ?9 ?? ?_)))
            (not (member current-identifier '(
                                              "bool" "Bool"
                                              "byte" "Byte"
                                              "chan"
                                              "complex128" "Complex128"
                                              "complex64" "Complex64"
                                              "error"
                                              "float32" "Float32"
                                              "float64" "Float64"
                                              "int" "Int"
                                              "int16" "Int16"
                                              "int32" "Int32"
                                              "int64" "Int64"
                                              "int8" "Int8"
                                              "rune" "Rune"
                                              "string" "String"
                                              "struct" "Struct"
                                              "uint" "Uint"
                                              "uint16" "Uint16"
                                              "uint32" "Uint32"
                                              "uint64" "Uint64"
                                              "uint8" "Uint8"
                                              "uintptr" "Uintptr"
                                              )))
            (or (not (equal ch-after ?\.))
                (string-match-p "^\\.[[:space:]\n]*\\(Bool\\|Float64\\|Int64\\|String\\|Time\\)"
                                str-after)))))))

;;; init-go-mode.el ends here
