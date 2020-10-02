;;; init-markdown-mode.el --- This file is part of Danil <danil@kutkevich.org> home.

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

(defcustom noxrcp-markdown-mode-patterns '()
  "Regexp patterns associated with `markdown-mode'."
  :group 'noxrcp)

(custom-set-variables '(markdown-command "blackfriday-tool")
                      '(noxrcp-markdown-mode-patterns '(
                                                        "/Dropbox/deft/.*\\.txt\\'"
                                                        "/README\\'"
                                                        "/mutt[-a-zA-Z0-9]+\\'"
                                                        "\\.markdown\\'"
                                                        "\\.md\\'"
                                                        "\\.mdown\\'"
                                                        )))

(add-hook 'after-init-hook 'noxrcp-markdown-mode)

(defun noxrcp-markdown-mode ()
  "My init."

  (dolist (pattern noxrcp-markdown-mode-patterns)
    (add-to-list 'auto-mode-alist (cons pattern 'markdown-mode)))

 (noxrcp-after-load 'markdown-mode
   (require 'eww) ;used for eww-mode live preview

   (set-face-attribute 'markdown-italic-face nil :slant 'normal) ;some terminals have difficulties with italic/bold

   (define-key markdown-mode-map "\M-n" nil) ;unset markdown-next-wiki-link
   (define-key markdown-mode-map "\M-p" nil) ;unset markdown-previous-wiki-link
   (define-key markdown-mode-map (kbd "TAB") 'markdown-cycle)))

;;; init-markdown-mode.el ends here
