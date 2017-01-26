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

(custom-set-variables
 '(rainbow-identifiers-faces-to-override '(
                                           default
                                           font-lock-variable-name-face

                                           js2-object-property
                                           js2-function-param
                                           ))
 '(myinit-rainbow-identifiers-hooks '(
                                      c-mode-hook
                                      go-mode-hook
                                      js2-parse-finished-hook
                                      php-mode-hook
                                      python-mode-hook
                                      ruby-mode-hook
                                      )))

(add-hook 'after-init-hook 'myinit-rainbow-identifiers)

(defun myinit-rainbow-identifiers ()
  "My init."

  (dolist (hook myinit-rainbow-identifiers-hooks) (add-hook hook 'rainbow-identifiers-mode))

  (myinit-after-load 'rainbow-identifiers
    ;; Use a wider set of colors.
    (setq rainbow-identifiers-choose-face-function 'rainbow-identifiers-cie-l*a*b*-choose-face)
    (setq rainbow-identifiers-cie-l*a*b*-lightness 70)
    (setq rainbow-identifiers-cie-l*a*b*-saturation 70)))

(defun myinit-rainbow-identifiers--face-overridable (begin faces-to-override)
  "Identifier under BEGIN is overridable if member of FACES-TO-OVERRIDE."
  (let ((face (get-text-property begin 'face)))
    (cond
     ((null face)
      t)
     ((listp face)
      (catch 'rainbow-identifiers--face-overridable
        (dolist (face* face)
          (unless (memq face* faces-to-override)
            (throw 'rainbow-identifiers--face-overridable nil)))
        t))
     (t
      (memq face faces-to-override)))))

;;; init-rainbow-identifiers.el ends here
