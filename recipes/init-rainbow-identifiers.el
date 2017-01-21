;;; init-rainbow-identifiers.el --- This file is part of Danil <danil@kutkevich.org> home.

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

;; Golang.

(defcustom myinit-rainbow-identifiers-hooks '()
  "Hooks associated with `rainbow-identifiers'."
  :group 'myinit)

(custom-set-variables '(myinit-rainbow-identifiers-hooks '(go-mode-hook)))

(add-hook 'after-init-hook 'myinit-rainbow-identifiers)

(defun myinit-rainbow-identifiers ()
  "My init."

  (dolist (hook myinit-rainbow-identifiers-hooks) (add-hook hook 'rainbow-identifiers-mode))

  (myinit-after-load 'rainbow-identifiers
    ;; Filter don't mark all identifiers.
    (add-hook 'rainbow-identifiers-filter-functions
              'myinit-rainbow-identifiers--filter)

    ;; Use a wider set of colors.
    (setq rainbow-identifiers-choose-face-function 'rainbow-identifiers-cie-l*a*b*-choose-face)
    (setq rainbow-identifiers-cie-l*a*b*-lightness 45)
    (setq rainbow-identifiers-cie-l*a*b*-saturation 45)))

;; <http://amitp.blogspot.ru/2014/09/emacs-rainbow-identifiers-customized.html>.
(defun myinit-rainbow-identifiers--filter (beg end)
  (and
   (rainbow-identifiers-face-overridable beg end)
   (let* ((ch-current (char-after beg))
          (ch-after (char-after end))
          (current-identifier (buffer-substring-no-properties beg end))
          (x 8)
          (y (if (> (+ end x) (point-max)) (point-max) (+ end x)))
          (str-after (buffer-substring-no-properties end y)))
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
              (or (string-prefix-p ".Bool" str-after)
                  (string-prefix-p ".Float64" str-after)
                  (string-prefix-p ".Int64" str-after)
                  (string-prefix-p ".String" str-after)
                  (string-prefix-p ".Time" str-after)))))))

;;; init-rainbow-identifiers.el ends here
