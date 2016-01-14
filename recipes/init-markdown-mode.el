;;; init-markdown-mode.el --- This file is part of Danil <danil@kutkevich.org> home.

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
 '(markdown-command "blackfriday-tool"))

(my-init--hook
  (my-init--add-mode-to-patterns 'markdown-mode
                                "/README\\'"
                                "/mutt[-a-zA-Z0-9]+\\'"
                                "\\.markdown\\'"
                                "\\.md\\'"
                                "\\.mdown\\'")

 (my-init--after-load 'markdown-mode
   (require 'eww) ;used for eww-mode live preview

   ;; Unset markdown-next-wiki-link and markdown-previous-wiki-link
   ;; <http://stackoverflow.com/questions/7598433/how-to-remove-a-key-from-a-minor-mode-keymap-in-emacs#7598754>.
   (define-key markdown-mode-map "\M-n" nil)
   (define-key markdown-mode-map "\M-p" nil)
   (define-key markdown-mode-map (kbd "C-c C-f") nil)))

;;; init-markdown-mode.el ends here
