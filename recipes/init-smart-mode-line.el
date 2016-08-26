;;; init-smart-mode-line.el --- This file is part of Danil <danil@kutkevich.org> home.

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

(custom-set-variables
 '(sml/name-width '(0 . 44))
 '(sml/replacer-regexp-list '(("^/sudo:.*:" ":SU:"))))

(autoload 'sml/setup "smart-mode-line" nil t)

(add-hook 'after-init-hook 'init-smart-mode-line)

(defun init-smart-mode-line ()
  "Init."

  (setq sml/theme frame-background-mode)
  (setq sml/no-confirm-load-theme t)

  (sml/setup)

  (custom-set-faces '(sml/git ((t :inherit (sml/not-modified sml/prefix)))))
  (custom-set-faces '(sml/global ((t (:foreground "gray60" :inverse-video nil)))))
  (custom-set-faces '(sml/line-number ((t (:foreground "brightwhite":weight normal)))))
  (custom-set-faces '(sml/position-percentage ((t (:inherit sml/read-only)))))
  (custom-set-faces '(sml/projectile ((t (:weight normal :inherit sml/filename)))))

  ;; (dolist (my-path-to-replace my-sml-replacements)
  ;;   (add-to-list 'sml/replacer-regexp-list my-path-to-replace))
  )

(defvar my-sml-replacements
  '(("^:s\\(v?\\):\\([^:]+:\\)?\\([^/]+\\)/" ":s\\1:\\2\\3:")
    ("^:s\\(v?\\):\\(c\\|cpp\\|el\\|md\\|js\\|python\\|ruby\\|go\\|org\\)/"
     ":s\\1:")
    ("^~/src/" ":s:")
    ("^~/src/vendor/" ":sv:")
    ("^:\\(medapp\\|molinos\\|avers\\|johnstudio\\):\\([^/]\\{0,6\\}\\)[^/]*?\\([^/]\\{0,4\\}\\)/"
     ":\\1:\\2\\3:")
    ("^~/src/vendor/waveaccess/" ":medapp:")
    ("^~/src/vendor/molinos/" ":molinos:")
    ("^~/src/vendor/avers/" ":avers:")
    ("^~/src/vendor/johnstudio/" ":johnstudio:"))

  "My smart-mode-line replacements.")

;;; init-smart-mode-line.el ends here
