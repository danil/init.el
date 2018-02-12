;;; init-ido.el --- This file is part of Danil <danil@kutkevich.org> home.

;; Copyright (C) 2018 Danil <danil@kutkevich.org>.
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

;; Interactively do things.

(custom-set-variables
 ;; '(ido-decorations '( "{ " " }" " | " " | ..." "[ " " ]" " [No match]" " [Matched]" " [Not readable]" " [Too big]" " [Confirm]"))
 ;; '(ido-ignore-buffers '("\\` " "^\*Mess" "^\*Back" ".*Completion" "^\*Ido" "^\*trace" "^\*compilation" "^\*GTAGS" "^session\.*") ;"^\*")) ;ignore these guys
 ;; '(ido-save-directory-list-file "~/.emacs.d/cache/ido.last")
 ;; '(ido-use-virtual-buffers t) ;if Recentf is enabled
 ;; '(ido-enable-regexp t) ; ???
 '(ido-case-fold t) ;be case-insensitive
 '(ido-confirm-unique-completion t) ;wait for RET, even with unique completion
 '(ido-enable-flex-matching t) ;fuzzy matching <http://webcache.googleusercontent.com/search?q=cache:wOWaMK_w_joJ:emacsblog.org/2008/05/19/giving-ido-mode-a-second-chance/&hl=en&tbo=d&strip=1>
 '(ido-enable-last-directory-history t) ;remember last used dirs
 '(ido-max-directory-size 100000)
 '(ido-max-prospects 500) ;don't spam my minibuffer
 '(ido-max-window-height 25)
 '(ido-max-work-directory-list 300) ;should be enough
 '(ido-max-work-file-list 200) ;remember many
 '(ido-mode 'both)
 '(ido-save-directory-list-file "~/.emacs.var/ido.last")
 '(ido-use-filename-at-point nil) ;don't use filename at point (annoying)
 '(ido-use-url-at-point nil) ;don't use url at point (annoying)
 '(ido-work-directory-list '("~/" "~/src" "~/Dropbox/deft")))

(add-hook 'after-init-hook 'myinit-ido)

(defun myinit-ido ()
  "My init."

  ;; (ido-mode 'both) ;for buffers and files
  ;; (ido-everywhere t)

  ;; (global-set-key (kbd "C-x b") 'my-switch-to-buffer)

  (if (boundp 'ido-mode) (myinit-lazy-ido)
    (with-eval-after-load 'ido (myinit-lazy-ido))))

(defun myinit-lazy-ido ()
  "My init lazy."
  ;; (define-key ido-common-completion-map "\C-p" 'ido-toggle-regexp)
  ;; When using ido, the confirmation is rather annoying.
  (custom-set-variables '(confirm-nonexistent-file-or-buffer nil)))

(defun my-switch-to-buffer (&optional arg)
  "Use `switch-to-buffer' or `my-switch-to-buffer-for-current-mode' if `ARG'."
  (interactive "P")
  (if arg
      (my-switch-to-buffer-for-current-mode)
    (ido-switch-buffer)))

;; <http://www.emacswiki.org/emacs/InteractivelyDoThings#toc6>.
(defun my-switch-to-buffer-for-current-mode ()
  "Limit ido to the current major mode."

  (interactive)

  (let ((current-mode major-mode))

    (switch-to-buffer
     (ido-completing-read (format "%s buffer: " current-mode)
                          (save-excursion
                            (delq
                             nil (mapcar (lambda (buf)
                                           (when (buffer-live-p buf)
                                             (with-current-buffer buf
                                               (and (eq major-mode current-mode)
                                                    (buffer-name buf)))))

                                         (buffer-list))))))))

;;; init-ido.el ends here
