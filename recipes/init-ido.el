;;; init-ido.el --- This file is part of Danil <danil@kutkevich.org> home.

;; Copyright (C) 2014-2015 Danil <danil@kutkevich.org>.
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

;;; Interactively do things.

(my-init--hook
  (ido-mode 'both) ;for buffers and files

  (custom-set-variables '(ido-max-window-height 25))
  ;; (custom-set-variables '(ido-decorations
  ;;                         '( "{ " " }"
  ;;                            " | " " | ..."
  ;;                            "[ " " ]"
  ;;                            " [No match]" " [Matched]"
  ;;                            " [Not readable]"
  ;;                            " [Too big]"
  ;;                            " [Confirm]")))
  (my-init--after-load 'ido
    (setq confirm-nonexistent-file-or-buffer nil) ;when using ido, the confirmation is rather annoying...

    (setq
     ;; ido-save-directory-list-file "~/.emacs.d/cache/ido.last"
     ;; ido-ignore-buffers '("\\` " "^\*Mess" "^\*Back" ".*Completion" "^\*Ido" "^\*trace" "^\*compilation" "^\*GTAGS" "^session\.*") ;"^\*") ;ignore these guys
     ido-work-directory-list '("~/" "~/Desktop" "~/Documents" "~src")
     ido-case-fold  t                 ; be case-insensitive

     ido-enable-last-directory-history t ;remember last used dirs
     ido-max-work-directory-list   300    ;should be enough
     ido-max-work-file-list        200    ;remember many
     ido-use-filename-at-point     nil   ;don't use filename at point (annoying)
     ido-use-url-at-point          nil   ;don't use url at point (annoying)

     ido-enable-flex-matching      t     ;fuzzy matching <http://webcache.googleusercontent.com/search?q=cache:wOWaMK_w_joJ:emacsblog.org/2008/05/19/giving-ido-mode-a-second-chance/&hl=en&tbo=d&strip=1>
     ido-max-prospects             500   ;don't spam my minibuffer
     ido-confirm-unique-completion t     ;wait for RET, even with unique completion

     ido-everywhere t
     ;; ido-use-virtual-buffers t           ;if Recentf is enabled
     ido-max-directory-size 100000)))

;;; init-ido.el ends here
