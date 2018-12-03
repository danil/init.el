;;; init-sql.el --- This file is part of Danil <danil@kutkevich.org> home.

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

(defcustom myinit-sql-mode-patterns '()
  "Regexp patterns associated with `sql-mode'."
  :group 'myinit)

(custom-set-variables '(myinit-sql-mode-patterns '("/Dropbox/deft/sql/.*\\.sql\\.md\\'")))

(add-hook 'after-init-hook 'myinit-sql)
(defun myinit-sql ()
  "My init."
  (dolist (pattern myinit-sql-mode-patterns)
    (add-to-list 'auto-mode-alist (cons pattern 'sql-mode)))
  (add-hook 'sql-login-hook 'myinit-sql--turn-on-history)
  (if (boundp 'sql-interactive-mode-map) (myinit-sql--setup)
    (with-eval-after-load 'sql (myinit-sql--setup))))

(defun myinit-sql--setup ()
  (add-hook 'sql-interactive-mode-hook 'myinit-sql--setup-keys)
  (add-hook 'sql-interactive-mode-hook
            'myinit-sql--sql-interactive-mode-setup-company-mode))

(defun myinit-sql--setup-keys ()
  (define-key sql-interactive-mode-map (my-kbd "C-l") 'myinit-sql--shell-clear))

(defun myinit-sql--sql-interactive-mode-setup-company-mode ()
  (if (boundp 'company-dabbrev-code-modes)
      (myinit-sql--sql-interactive-mode-myinit-company-dabbrev-code-setup)
    (with-eval-after-load 'company-dabbrev
      (myinit-sql--sql-interactive-mode-myinit-company-dabbrev-code-setup))))

(defun myinit-sql--sql-interactive-mode-myinit-company-dabbrev-code-setup ()
  (set (make-local-variable 'company-backends)
       (append '(company-dabbrev-code) company-backends))
  (setq company-dabbrev-code-modes
        (append '(sql-interactive-mode)
                (append company-dabbrev-code-modes
                        myinit-programming-modes))))

;;; SQL inferior comint mode history
;;; <https://oleksandrmanzyuk.wordpress.com/2011/10/23/a-persistent-command-history-in-emacs/>,
;;; <http://www.emacswiki.org/emacs/SqlMode#toc3>.
(defun myinit-sql--turn-on-history ()
  "Set SQL history file path and assign hook on sentinel event."

  (let* ((product (symbol-name (symbol-value 'sql-product)))

         (history-file (cond ((equal product "postgres") "~/.psql_history")
                             ((equal product "sqlite") "~/.sqlite_history")
                             ((equal product "mysql") "~/.emacs.var/mysql_history"))))

    (let ((process (get-buffer-process (current-buffer))))
      (when process
        (setq comint-input-ring-file-name history-file)
        (comint-read-input-ring)
        (set-process-sentinel process #'myinit-comint--write-history)))))

(defun myinit-sql--shell-clear (&optional arg)
  "Delete output from `SQl' shell or kill output from `SQL' shell if `ARG'.
Clear current `SQL' shell beginning with a-la prompt to `point-min'.
Clearing by `delete-region' or by `kill-region' if `ARG'."

  (interactive "P")

  (let ((prompt-string (cond ((equal sql-product 'postgres) "=#")
                             ((equal sql-product 'mysql) "mysql>")
                             (t nil))))

    (when prompt-string
      (goto-char (point-max))
      (search-backward prompt-string)
      (beginning-of-line)

      (if arg
          (kill-region (point-min) (point))
        (delete-region (point-min) (point)))

      (delete-region (point-min) (point))

      (goto-char (point-max)))))

;;; init-sql.el ends here
