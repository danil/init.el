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

(defcustom myinit-rainbow-identifiers-hooks '()
  "Hooks associated with `rainbow-identifiers'."
  :group 'myinit)

(custom-set-variables
 '(myinit-rainbow-identifiers-hooks
   '(
     (c-mode-common-hook myinit-c-mode--rainbow-identifiers-init)
     (coffee-mode-hook myinit-coffee-mode--rainbow-identifiers-init)
     (conf-colon-mode-hook myinit-conf-colon-mode--rainbow-identifiers-init)
     (conf-space-mode-hook myinit-conf-space-mode--rainbow-identifiers-init)
     (conf-unix-mode-hook myinit-conf-unix-mode--rainbow-identifiers-init)
     (conf-xdefaults-mode-hook myinit-conf-xdefaults-mode--rainbow-identifiers-init)
     (css-mode-hook myinit-css-mode--rainbow-identifiers-init)
     (go-mode-hook myinit-go-mode--rainbow-identifiers-init)
     (haproxy-mode-hook myinit-haproxy-mode--rainbow-identifiers-init)
     (js2-parse-finished-hook myinit-js2-mode--rainbow-identifiers-init)
     (json-mode-hook myinit-json-mode--rainbow-identifiers-init)
     (nginx-mode-hook myinit-nginx-mode--rainbow-identifiers-init)
     (php-mode-hook myinit-php-mode--rainbow-identifiers-init)
     (python-mode-hook myinit-python-mode--rainbow-identifiers-init)
     (ruby-mode-hook myinit-ruby-mode--rainbow-identifiers-init)
     (sh-mode-hook myinit-sh-mode--rainbow-identifiers-init)
     (sql-interactive-mode-hook myinit-sql-interactive-mode--rainbow-identifiers-init)
     (sql-mode-hook myinit-sql-mode--rainbow-identifiers-init)
     (toml-mode-hook myinit-toml-mode--rainbow-identifiers-init)
     (web-mode-hook myinit-web-mode--rainbow-identifiers-init)
     (yaml-mode-hook myinit-yaml-mode--rainbow-identifiers-init)
     )))

(add-hook 'after-init-hook 'myinit-rainbow-identifiers)

(defun myinit-rainbow-identifiers ()
  "My init."

  (dolist (hook myinit-rainbow-identifiers-hooks)
    (let ((h (car hook))
          (init-fn (nth 1 hook)))
      (when (fboundp init-fn) (add-hook h init-fn))))

  (myinit-after-load 'rainbow-identifiers
    ;; Use a wider set of colors.
    (setq rainbow-identifiers-choose-face-function 'rainbow-identifiers-cie-l*a*b*-choose-face)
    (setq rainbow-identifiers-cie-l*a*b*-lightness 70)
    (setq rainbow-identifiers-cie-l*a*b*-saturation 70)))

(defun myinit-rainbow-identifiers--lazyinit ()
  "Run `rainbow-identifiers'."

  (myinit-run-with-idle-timer-in-current-buffer
   myinit-default-idle-timer-seconds nil 'rainbow-identifiers-mode))

(defun myinit-rainbow-identifiers--face-overridable (begin end)
  "My test if the face of the identifier under BEGIN is overridable."
  (let ((face (get-text-property begin 'face)))
    (cond
     ((null face)
      nil)
     ((listp face)
      (catch 'rainbow-identifiers--face-overridable
        (dolist (face* face)
          (unless (memq face* rainbow-identifiers-faces-to-override)
            (throw 'rainbow-identifiers--face-overridable nil)))
        t))
     (t
      (memq face rainbow-identifiers-faces-to-override)))))

;;; init-rainbow-identifiers.el ends here
