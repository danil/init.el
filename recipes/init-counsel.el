;;; init-counsel.el --- This file is part of Danil <danil@kutkevich.org> home.

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

;; (defvar myinit-counsel-ag-base-command-name "ag")

;; (defvar myinit-counsel-ag-base-command-args
;;   (if (memq system-type '(ms-dos windows-nt))
;;       "--vimgrep"
;;     "--nocolor --nogroup"))

;; (custom-set-variables
;;  '(counsel-ag-base-command (format "%s %s %s"
;;                                    myinit-counsel-ag-base-command-name
;;                                    myinit-counsel-ag-base-command-args
;;                                    "%s")))

(add-hook 'after-init-hook 'myinit-counsel)

(defun myinit-counsel ()
  "My init."

  (if (boundp 'help-map) (myinit-customize-counsel-help)
    (with-eval-after-load 'help (myinit-customize-counsel-help)))

  (myinit-customize-ivy-key))

(defun myinit-customize-ivy-key ()
  "My init customize keys."

  (when (boundp 'minibuffer-local-map)
    (define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history))

  (when (boundp 'myinit-map)
    (unless (fboundp 'ag/read-from-minibuffer) (require 'ag))
    (define-key myinit-map (kbd "j a") 'my-counsel-ag)
    (define-key myinit-map (kbd "j A a") 'my-counsel-ag-with-args)

    (define-key myinit-map (kbd "j p") 'counsel-pt)
    (define-key myinit-map (kbd "j r") 'counsel-rg))

  ;; (global-set-key (kbd "C-c g") 'counsel-git)
  ;; (global-set-key (kbd "C-c j") 'counsel-git-grep)
  ;; (global-set-key (kbd "C-x l") 'counsel-locate)

  (global-set-key (kbd "M-x") 'counsel-M-x)
  (global-set-key (kbd "C-x C-f") 'counsel-find-file)
  (global-set-key (kbd "C-x C-r") 'counsel-recentf))

(defun myinit-customize-counsel-help()
  "My init customize help."
  (define-key help-map (kbd "F") 'counsel-describe-face)
  (define-key help-map (kbd "f") 'counsel-describe-function)
  (define-key help-map (kbd "i") 'counsel-info-lookup-symbol)
  (define-key help-map (kbd "l") 'counsel-find-library)
  (define-key help-map (kbd "u") 'counsel-unicode-char)
  (define-key help-map (kbd "v") 'counsel-describe-variable))

(defun my-counsel-ag (initial-input initial-directory)
  "Search using ag in a given `INITIAL-DIRECTORY` for a given literal search `INITIAL-INPUT`,
with `INITIAL-INPUT` defaulting to the symbol under point.

If called with a prefix, prompts for flags to pass to ag."
  (interactive (list (ag/read-from-minibuffer "Search string")
                     (read-directory-name "Directory: ")))
  (counsel-ag initial-input initial-directory))

(defun my-counsel-ag-with-args (initial-input initial-directory extra-ag-args)
  "Search using ag in a given `INITIAL-DIRECTORY` for a given literal search `INITIAL-INPUT`,
with `INITIAL-INPUT` defaulting to the symbol under point.

If called with a prefix, prompts for flags to pass to ag."
  (interactive (list (ag/read-from-minibuffer "Search string")
                     (read-directory-name "Directory: ")
                     (read-string "Arguments: ")))
  (counsel-ag initial-input initial-directory extra-ag-args))

;; <https://stackoverflow.com/questions/757564/in-emacs-lisp-how-do-i-check-if-a-variable-is-defined>
;; <https://emacs.stackexchange.com/questions/28365/how-do-you-correctly-escape-characters-in-string-for-example>
;; <https://stackoverflow.com/questions/6156286/emacs-lisp-call-function-with-prefix-argument-programmatically>
;; <https://emacs.stackexchange.com/questions/13886/what-is-a-raw-prefix-argument-capital-p-in-interactive>

;; (defun my-counsel-ag (initial-directory &optional arg)
;;   "Search using ag in a given `INITIAL-DIRECTORY` with optional `ARG'.

;; If called with `ARG', prompts for flags to pass to ag.
;; If `ARG' is a number pass to ag --context=`ARG'.
;; If there is a symbol under cursor, then pass it as initial ag imput."
;;   (interactive (list (ag/read-from-minibuffer "Search string")
;;                      (read-directory-name "Directory: ")))

;;   (let ((extra-ag-args) (when arg
;;                           (if (integerp arg)
;;                               extra-ag-args
;;                             (read-string "Arguments: "
;;                                          (replace-regexp-in-string "%s" ""
;;                                                                    (substring-no-properties counsel-ag-base-command
;;                                                                                             (cl-position ?  counsel-ag-base-command)))))))

;;     (counsel-ag initial-input initial-directory)))

;; (defun my-counsel-ag-with-args (initial-input initial-directory extra-ag-args)
;;   "Search using ag in a given `INITIAL-DIRECTORY` for a given literal search `INITIAL-INPUT`,
;; with `INITIAL-INPUT` defaulting to the symbol under point.

;; If called with a prefix, prompts for flags to pass to ag."
;;   (interactive (list (ag/read-from-minibuffer "Search string")
;;                      (read-directory-name "Directory: ")
;;                      (read-string "Arguments: ")))
;;   (counsel-ag initial-input initial-directory extra-ag-args))

;;; init-counsel.el ends here
