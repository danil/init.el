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

(defcustom noxrcp-rainbow-identifiers-hooks '()
  "Hooks associated with `rainbow-identifiers'."
  :group 'noxrcp)

(custom-set-variables
 '(noxrcp-rainbow-identifiers-hooks
   '(
     (c-mode-common-hook noxrcp-c-mode--rainbow-identifiers-init)
     (clojure-mode-hook noxrcp-clojure-mode--rainbow-identifiers-init)
     (coffee-mode-hook noxrcp-coffee-mode--rainbow-identifiers-init)
     (conf-colon-mode-hook noxrcp-conf-colon-mode--rainbow-identifiers-init)
     (conf-space-mode-hook noxrcp-conf-space-mode--rainbow-identifiers-init)
     (conf-unix-mode-hook noxrcp-conf-unix-mode--rainbow-identifiers-init)
     (conf-xdefaults-mode-hook noxrcp-conf-xdefaults-mode--rainbow-identifiers-init)
     (csharp-mode-hook noxrcp-csharp-mode--rainbow-identifiers-init)
     (css-mode-hook noxrcp-css-mode--rainbow-identifiers-init)
     (dockerfile-mode-hook noxrcp-dockerfile-mode--rainbow-identifiers-init)
     (elixir-mode-hook noxrcp-elixir-mode--rainbow-identifiers-init)
     (emacs-lisp-mode-hook noxrcp-emacs-lisp-mode--rainbow-identifiers-init)
     (enh-ruby-mode-hook noxrcp-enh-ruby-mode--rainbow-identifiers-init)
     (go-mode-hook noxrcp-go-mode--rainbow-identifiers-init)
     (haproxy-mode-hook noxrcp-haproxy-mode--rainbow-identifiers-init)
     (hcl-mode-hook noxrcp-hcl-mode--rainbow-identifiers-init)
     (js2-parse-finished-hook noxrcp-js2-mode--rainbow-identifiers-init)
     (json-mode-hook noxrcp-json-mode--rainbow-identifiers-init)
     (lisp-mode-hook noxrcp-lisp-mode--rainbow-identifiers-init)
     (lua-mode-hook noxrcp-lua-mode--rainbow-identifiers-init)
     (nginx-mode-hook noxrcp-nginx-mode--rainbow-identifiers-init)
     (php-mode-hook noxrcp-php-mode--rainbow-identifiers-init)
     (protobuf-mode-hook noxrcp-protobuf-mode--rainbow-identifiers-init)
     (python-mode-hook noxrcp-python-mode--rainbow-identifiers-init)
     (ruby-mode-hook noxrcp-ruby-mode--rainbow-identifiers-init)
     (rust-mode-hook noxrcp-rust-mode--rainbow-identifiers-init)
     (sh-mode-hook noxrcp-sh-mode--rainbow-identifiers-init)
     (slim-mode-hook noxrcp-slim-mode--rainbow-identifiers-init)
     (sql-interactive-mode-hook noxrcp-sql-interactive-mode--rainbow-identifiers-init)
     (sql-mode-hook noxrcp-sql-mode--rainbow-identifiers-init)
     (systemd-mode-hook noxrcp-systemd--rainbow-identifiers-init)
     (toml-mode-hook noxrcp-toml-mode--rainbow-identifiers-init)
     (web-mode-hook noxrcp-web-mode--rainbow-identifiers-init)
     (yaml-mode-hook noxrcp-yaml-mode--rainbow-identifiers-init)
     )))

(add-hook 'after-init-hook 'noxrcp-rainbow-identifiers)

(defun noxrcp-rainbow-identifiers ()
  "No X recipe init."

  (dolist (hook noxrcp-rainbow-identifiers-hooks)
    (let ((h (car hook))
          (init-fn (nth 1 hook)))
      (when (fboundp init-fn) (add-hook h init-fn))))

  (noxrcp-after-load 'rainbow-identifiers
    ;; Use a wider set of colors.
    (setq rainbow-identifiers-choose-face-function 'rainbow-identifiers-cie-l*a*b*-choose-face)
    (setq rainbow-identifiers-cie-l*a*b*-lightness 70)
    (setq rainbow-identifiers-cie-l*a*b*-saturation 70)))

(defun noxrcp-rainbow-identifiers--lazyinit ()
  "Run `rainbow-identifiers'."
  (noxrcp-run-with-idle-timer-in-current-buffer
   noxrcp-default-idle-timer-seconds nil 'rainbow-identifiers-mode))

(defun noxrcp-rainbow-identifiers--face-overridable (begin end)
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
