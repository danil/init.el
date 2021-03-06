;;; init-protobuf-mode.el --- This file is part of Danil <https://danil.kutkevich.org> home.

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

(add-hook 'after-init-hook 'noxrcp-protobuf-mode)
(defun noxrcp-protobuf-mode ()
  "No X recipe init."
  (if (boundp 'protobuf-mode-map) (noxrcp-protobuf-mode--setup)
    (with-eval-after-load 'protobuf-mode (noxrcp-protobuf-mode--setup))))

(defun noxrcp-protobuf-mode--setup ()
  (define-key protobuf-mode-map (kbd "C-c C-f e") 'noxrcp-protobuf-mode--end-of-defun)
  (define-key protobuf-mode-map (kbd "C-c C-f n") 'noxrcp-protobuf-mode--beginning-of-defun))

(defun noxrcp-protobuf-mode--beginning-of-defun ()
  (interactive)
  (call-interactively 'beginning-of-defun)
  (search-forward "message "))

(defun noxrcp-protobuf-mode--end-of-defun ()
  (interactive)
  (call-interactively 'end-of-defun)
  (when (search-backward "}" nil t) (forward-char)))

(defun init-protobuf-mode-rainbow-identifiers-setup ()
  (when (equal major-mode 'protobuf-mode)
    (make-local-variable 'rainbow-identifiers-filter-functions)
    (add-hook 'rainbow-identifiers-filter-functions
              'rainbow-identifiers-face-overridable)
    (add-hook 'rainbow-identifiers-filter-functions
              'noxrcp-protobuf-mode--rainbow-identifiers-filter)
    (make-local-variable 'rainbow-identifiers-faces-to-override)
    (setq rainbow-identifiers-faces-to-override '(
                                                  font-lock-type-face
                                                  font-lock-variable-name-face
                                                  ))
    (init-rainbow-identifiers--lazy-setup)))

;; <http://amitp.blogspot.ru/2014/09/emacs-rainbow-identifiers-customized.html>.
(defun noxrcp-protobuf-mode--rainbow-identifiers-filter (beg end)
  "My rainbow-identifiers custom init for symbol between `BEG' and `END'."

  (let ((ch-cur (char-after beg))
        (ch-before (char-before beg))
        (ch-after (char-after end))
        (str-cur (buffer-substring-no-properties beg end))
        (ch80-before (let ((i 80))
                       (if (< (point-min) (- beg i))
                           (buffer-substring-no-properties (- beg i) beg)
                         (buffer-substring-no-properties (point-min) beg))))
        (ch80-after (let ((i 80))
                      (if (> (point-max) (+ end i))
                          (buffer-substring-no-properties end (+ end i))
                        (buffer-substring-no-properties end (point-max)))))
        (str-before (buffer-substring-no-properties (point-min) beg))
        (str-after (buffer-substring-no-properties end (point-max))))
    (and (not (member ch-cur '(?0 ?1 ?2 ?3 ?4 ?5 ?6 ?7 ?8 ?9 ?? ?_)))
         (not (member str-cur '(
                                "bool"
                                "bytes"
                                "double"
                                "fixed32"
                                "fixed64"
                                "float"
                                "int32"
                                "int64"
                                "oneof"
                                "sfixed32"
                                "sfixed64"
                                "sint32"
                                "sint64"
                                "string"
                                "syntax"
                                "uint32"
                                "uint64"
                                ))))))

;;; init-protobuf-mode.el ends here
