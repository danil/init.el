;;; init-smart-mode-line.el --- This file is part of Danil <danil@kutkevich.org> home.

;; Copyright (C) 2014-2015 Danil <danil@kutkevich.org>.
;; Author: Danil <danil@kutkevich.org>
;; Version: 0.0.0
;; Package-Requires: ()
;; Keywords: convenience
;; URL: http://danil.kutkevich.org/p/el/init.el

;;; Commentary:

;; Please see README.md for documentation, or read it online at
;; http://danil.kutkevich.org/p/el/init.el

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
(custom-set-variables '(sml/replacer-regexp-list '(("^/sudo:.*:" ":SU:"))))

(autoload 'sml/setup "smart-mode-line" nil t)

(my-after-init
  (setq sml/theme frame-background-mode)
  (setq sml/no-confirm-load-theme t)

  (sml/setup)

  (custom-set-faces '(sml/global ((t (:foreground "gray60"
                                                  :inverse-video nil)))))

  ;; (dolist (my-path-to-replace my-sml-replacements)
  ;;   (add-to-list 'sml/replacer-regexp-list my-path-to-replace))

  (custom-set-faces '(sml/git ((t :inherit (sml/not-modified sml/prefix))))))

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
