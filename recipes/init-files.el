;;; init-files.el --- This file is part of Danil <danil@kutkevich.org> home.

;; Copyright (C) 2020 Danil <danil@kutkevich.org>.
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
 '(mode-require-final-newline nil) ;otherwise warning: you have `mode-require-final-newline' turned on. ethan-wspace supersedes `require-final-newline', so `mode-require-final-newline' will be turned off

 ;; Get rid of annoying backups, temporary files and autosaves
 ;; (Built-in backup settings
 ;; <http://www.emacswiki.org/emacs/BackupDirectory#toc2>).
 '(backup-by-copying t) ; don't clobber symlinks
 '(backup-directory-alist '(("." . "~/.emacs.var/backups"))) ; don't litter my fs tree
 '(delete-old-versions t)
 '(directory-free-space-args "--human-readable")
 '(kept-new-versions 6)
 '(kept-old-versions 2)
 '(version-control t) ; use versioned backups
 )

(add-hook 'after-init-hook 'noxrcp-files)

(defun noxrcp-files ()
  "No X recipe init."

  (global-set-key (kbd "C-x C-f") 'noxrcp-files--find-file)
  (global-set-key (kbd "C-x C-d") 'noxrcp-files--list) ; 'list-directory

  (when (boundp 'noxrcp-map)
    (define-key noxrcp-map (kbd "B r") 'revert-buffer)))

(defun noxrcp-files--find-file ()
  (interactive)
  (let ((n current-prefix-arg))
    (setq current-prefix-arg nil)
    (cond ((equal n '(4))
           (setq current-prefix-arg '(4))
           (call-interactively 'counsel-fd-file-jump))
          ((equal n 7)
           (counsel-find-file))
          (t
           (call-interactively 'find-file)))))

(defun noxrcp-files--list ()
  (interactive)
  (let ((n current-prefix-arg))
    (cond ((equal n '(4))
           (call-interactively 'counsel-fd-dired-jump))
          ((equal n 7)
           (call-interactively 'list-directory))
          (t
           (setq current-prefix-arg '(4))
           (call-interactively 'fd-dired)))))

;; ;; Redefining the make-auto-save-file-name function in order to get
;; ;; autosave files sent to a single directory.  Note that this function
;; ;; looks first to determine if you have a ~/.autosaves/ directory.  If
;; ;; you do not it proceeds with the standard auto-save procedure.
;; (defun make-auto-save-file-name ()
;;   "Return file name to use for auto-saves of current buffer.."
;;   (if buffer-file-name
;;       (if (file-exists-p "~/.autosaves/")
;;           (concat (expand-file-name "~/.autosaves/") "#"
;;                   (replace-regexp-in-string "/" "!" buffer-file-name)
;;                   "#")
;;          (concat
;;           (file-name-directory buffer-file-name)
;;           "#"
;;           (file-name-nondirectory buffer-file-name)
;;           "#"))
;;     (expand-file-name
;;      (concat "#%" (buffer-name) "#"))))

;;; init-files.el ends here
