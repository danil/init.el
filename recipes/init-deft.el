;;; init-deft.el --- This file is part of Danil <danil@kutkevich.org> home.

;; Copyright (C) 2015 Danil <danil@kutkevich.org>.
;; Author: Danil <danil@kutkevich.org>
;; Version: 0.0.1
;; Package-Requires: ((my-init))
;; Keywords: convenience
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
 '(deft-auto-save-interval 30.0) ; Idle time in seconds before automatically saving buffers opened by Deft. Set to zero to disable.
 '(deft-directory "~/Dropbox/deft") ; <http://jblevins.org/projects/deft>
 '(deft-extensions '("md" "markdown" "org" "mw" "txt" "restclient")) ; Any files with these extensions will be listed. The first element of the list is used as the default file extension of newly created files, if `deft-default-extension` is not set.
 '(deft-recursive t) ; Recursively search for files in subdirectories when non-nil.
 '(deft-strip-title-regexp
    (concat "\\(?:"
            "^%+" ; line beg with %
            "\\|^Title:[\t ]*" ; MultiMarkdown metadata
            "\\|^#\\+TITLE: *" ; org-mode title
            "\\|^[#* ]+" ; line beg with #, * and/or space
            "\\|-\\*-[[:alpha:]]+-\\*-" ; -*- .. -*- lines
            "\\|[={']+" ; MediaWiki markup == Header == or {{Infobox or '''Bold'''
            "\\|#+" ; line with just # chars
            "$\\)")) ;Regular expression to remove from file titles. Presently, it removes leading LaTeX comment delimiters, leading and trailing hash marks from Markdown ATX headings, leading astersisks from Org Mode headings, and Emacs mode lines of the form -*-mode-*-.
 )

(my-init--hook
  ;; (my-init--after-load 'deft
  ;;   (define-key deft-mode-map (kbd "C-c C-f") nil))

  (define-key myinit-map (kbd "x d") 'my-deft))

(defun my-deft (&optional arg)
  "Open `deft' list or create `deft' item if `ARG'."

  (interactive "P")
  (if arg (deft-new-file) (deft)))

;;; init-deft.el ends here
