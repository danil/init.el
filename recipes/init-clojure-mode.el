;;; init-clojure-mode.el --- This file is part of Danil <danil@kutkevich.org> home.

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

(add-hook 'after-init-hook 'noxrcp-clojure-mode)

(defun noxrcp-clojure-mode ()
  "No X recipe init."

  ;; (noxrcp-after-load 'clojure-mode
  ;;   (define-key clojure-mode-map (nox-kbd "C-v") 'clojure-yaless-mode-on))

  (noxrcp-add-mode-to-patterns 'clojure-mode "/\\.lein-env\\'"))

(defun noxrcp-clojure-mode--rainbow-identifiers-init ()
  (when (equal major-mode 'clojure-mode)
    (make-local-variable 'rainbow-identifiers-filter-functions)
    (add-hook 'rainbow-identifiers-filter-functions
              'noxrcp-clojure-mode--rainbow-identifiers-filter)

    (noxrcp-rainbow-identifiers--lazyinit)))

(defun noxrcp-clojure-mode--rainbow-identifiers-filter (beg end)
  "My rainbow-identifiers custom init for symbol between `BEG' and `END'."

  (let ((face-cur (or (get-char-property beg 'read-face-name)
                      (get-char-property beg 'face)))
        (ch-cur (char-after beg))
        (str-cur (buffer-substring-no-properties beg end)))
    (and
     (or
      (eq face-cur nil)
      (eq face-cur 'clojure-keyword-face)
      (eq face-cur 'default)
      (eq face-cur 'font-lock-function-name-face)
      (eq face-cur 'font-lock-type-face))
     (not (member ch-cur
                  '(?% ?* ?+ ?- ?/ ?0 ?1 ?2 ?3 ?4 ?5 ?6 ?7 ?8 ?9 ?< ?< ?= ?> ?? ?_ ?`)))
     ;; (not (member str-cur '(
     ;;                                   )))
     )))

;; (defun clojure-yaless-mode-on (&optional arg)
;;   (interactive "P")

;;   (when (and (not arg) (buffer-file-name))
;;     (call-interactively 'save-buffer)
;;     ;; (when (fboundp 'cider-load-buffer) (cider-load-buffer))
;;     )

;;   (call-interactively 'yaless-mode))

;; (defun my-clojure-less-minor-mode ()
;;   (interactive)
;;   (when (and (or (not (boundp 'less-minor-mode))
;;                  (not less-minor-mode))
;;              (buffer-file-name))
;;     (call-interactively 'save-buffer)
;;     (cider-load-buffer))
;;   (call-interactively 'less-minor-mode))

;;; init-clojure-mode.el ends here
