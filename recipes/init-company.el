;;; init-company.el --- This file is part of Danil <https://danil.kutkevich.org> home.

;; Copyright (C) 2021 Danil <https://danil.kutkevich.org>.
;; Author: Danil <https://danil.kutkevich.org>
;; Maintainer: Danil <https://danil.kutkevich.org>
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

(defcustom noxrcp-company--completing-read-function 'noxrcp-selectrum--company ; 'noxrcp-counsel--company
  "No X recipe custom variable for the company completing read function."
  :group 'noxrcp)

;; The common sources for all modes
;; <https://github.com/gorakhargosh/emacs.d/blob/master/config-completion.el>.
(custom-set-variables
 ;; '(company-abort-manual-when-too-short nil)
 ;; '(company-global-modes t)
 ;; '(company-show-numbers nil)
 ;; '(company-tooltip-limit 10)
 ;; '(company-tooltip-margin 1)
 ;; '(company-tooltip-maximum-width most-positive-fixnum)
 ;; '(company-tooltip-minimum 6)
 ;; '(company-tooltip-minimum-width 0)
 ;; '(company-tooltip-offset-display 'scrollbar)
 ;; '(company-lighter-base "company")
 ;; '(company-tooltip-idle-delay nil) ;; .5
 '(company-frontends nil) ;; nil '()
 '(company-idle-delay nil) ;; 0.7 tradeoff between typing speed and performance <https://emacs.stackexchange.com/questions/32467/how-can-i-configure-company-mode-to-only-display-candidates-after-an-explicit-ke#32523>
 '(company-minimum-prefix-length 0))

(add-hook 'after-init-hook 'noxrcp-company)
(defun noxrcp-company ()
  "No X recipe init."

  (if (boundp 'company-mode) (noxrcp-company--setup)
    (with-eval-after-load 'company (noxrcp-company--setup)))

  (global-set-key [?\C-\M-i] 'noxrcp-company--completing-read) ; counsel-company completion-at-point

  (global-company-mode t))

(defun noxrcp-company--setup ()
  (custom-set-variables
   '(company-backends `(,@(unless (version< "24.3.51" emacs-version)
                            (list 'company-elisp))
                        company-bbdb
                        ,@(unless (version<= "26" emacs-version)
                            (list 'company-nxml))
                        ,@(unless (version<= "26" emacs-version)
                            (list 'company-css))
                        company-semantic
                        company-clang
                        company-cmake
                        company-files
                        (company-dabbrev-code
                         company-gtags
                         company-etags
                         company-keywords)
                        company-dabbrev
                        company-abbrev
                        company-oddmuse
                        company-capf))))

(defun noxrcp-company--completing-read ()
  (interactive)
  (company-mode t)
  (when current-prefix-arg (make-local-variable 'company-backends))
  (cond ((equal current-prefix-arg 2)
         (noxrcp-company--complete-with-backend 'company-capf))
        ((equal current-prefix-arg 3)
         (noxrcp-company--complete-with-backend 'company-abbrev))
        ((equal current-prefix-arg 4)
         (noxrcp-company--complete-with-backend 'company-files))
        ((equal current-prefix-arg 7)
         (noxrcp-company--complete-with-backend 'company-dabbrev-code))
        ((equal current-prefix-arg 8)
         (noxrcp-company--complete-with-backend 'company-dabbrev))
        (current-prefix-arg
         (noxrcp-company--complete-with-backend 'company-ispell)))
  (call-interactively noxrcp-company--completing-read-function))

(defun noxrcp-company--complete-with-backend (new-backend)
  (let ((old-company-backends company-backends))
    (set 'company-backends (cons new-backend '()))
    (company-complete)
    (set 'company-backends old-company-backends)))

(defun noxrcp-company--grab-symbol ()
  "If point is at the end of a symbol, return it.
Otherwise, if point is not inside a symbol, return an empty string."
  (buffer-substring (point)
                    (save-excursion (skip-syntax-backward "w_") (point))))

(defun noxrcp-company--message-used-backend ()
  (interactive)
  (message "Company backend: %s"
           (pp-to-string (noxrcp-company--used-backend))))

(defun noxrcp-company--used-backend ()
  (interactive)
  (let* ((bb company-backends)
         backend
         (prefix (cl-loop for b in bb
                          thereis (let ((company-backend b))
                                    (setq backend b)
                                    (company-call-backend 'prefix)))))
    backend))

;; ;; <https://stackoverflow.com/questions/3815467/stripping-duplicate-elements-in-a-list-of-strings-in-elisp#3815828>.
;; (defun noxrcp-company--strip-duplicates (list)
;;   (let ((new-list nil))
;;     (while list
;;       (when (and (car list) (not (member (car list) new-list)))
;;         (setq new-list (cons (car list) new-list)))
;;       (setq list (cdr list)))
;;     (nreverse new-list)))

;;; init-company.el ends here
