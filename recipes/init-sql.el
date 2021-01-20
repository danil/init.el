;;; init-sql.el --- This file is part of Danil <https://danil.kutkevich.org> home.

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

(defcustom noxrcp-sql-mode-patterns '()
  "Regexp patterns associated with `sql-mode'."
  :group 'noxrcp)

(custom-set-variables '(noxrcp-sql-mode-patterns '("/Dropbox/deft/sql/.*\\.sql\\.md\\'")))

(add-hook 'after-init-hook 'noxrcp-sql)
(defun noxrcp-sql ()
  "No X recipe init."
  (dolist (pattern noxrcp-sql-mode-patterns)
    (add-to-list 'auto-mode-alist (cons pattern 'sql-mode)))
  (add-hook 'sql-login-hook 'noxrcp-sql--turn-on-history)
  (if (boundp 'sql-interactive-mode-map) (noxrcp-sql--setup)
    (with-eval-after-load 'sql (noxrcp-sql--setup))))

(defun noxrcp-sql--setup ()
  (add-hook 'sql-interactive-mode-hook 'noxrcp-sql--setup-keys)
  (add-hook 'sql-interactive-mode-hook
            'noxrcp-sql--sql-interactive-mode-setup-company-mode))

(defun noxrcp-sql--setup-keys ()
  (define-key sql-interactive-mode-map (nox-kbd "C-l") 'noxrcp-sql--shell-clear))

(defun noxrcp-sql--sql-interactive-mode-setup-company-mode ()
  (if (boundp 'company-dabbrev-code-modes)
      (noxrcp-sql--sql-interactive-mode-noxrcp-company-dabbrev-code-setup)
    (with-eval-after-load 'company-dabbrev
      (noxrcp-sql--sql-interactive-mode-noxrcp-company-dabbrev-code-setup))))

(defun noxrcp-sql--sql-interactive-mode-noxrcp-company-dabbrev-code-setup ()
  (set (make-local-variable 'company-backends)
       (append '(company-dabbrev-code) company-backends))
  (setq company-dabbrev-code-modes
        (append '(sql-interactive-mode)
                (append company-dabbrev-code-modes
                        noxrcp-programming-modes))))

;;; SQL inferior comint mode history
;;; <https://oleksandrmanzyuk.wordpress.com/2011/10/23/a-persistent-command-history-in-emacs/>,
;;; <http://www.emacswiki.org/emacs/SqlMode#toc3>.
(defun noxrcp-sql--turn-on-history ()
  "Set SQL history file path and assign hook on sentinel event."

  (let* ((product (symbol-name (symbol-value 'sql-product)))

         (history-file (cond ((equal product "postgres") "~/.psql_history")
                             ((equal product "sqlite") "~/.sqlite_history")
                             ((equal product "mysql") "~/.emacs.var/mysql_history"))))

    (let ((process (get-buffer-process (current-buffer))))
      (when process
        (setq comint-input-ring-file-name history-file)
        (comint-read-input-ring)
        (set-process-sentinel process #'noxrcp-comint--write-history)))))

(defun noxrcp-sql--shell-clear (&optional arg)
  "Delete output from `SQl' shell or kill output from `SQL' shell if `ARG'.
Clear current `SQL' shell beginning with a-la prompt to `point-min'.
Clearing by `delete-region' or by `kill-region' if `ARG'."

  (interactive "P")

  (let ((prompt-regex (cond ((equal sql-product 'postgres) "=[#>]")
                            ((equal sql-product 'mysql) "mysql>")
                            (t nil))))

    (when prompt-regex
      (goto-char (point-max))
      (search-backward-regexp prompt-regex nil 'noerror)
      (beginning-of-line)

      (if arg
          (kill-region (point-min) (point))
        (delete-region (point-min) (point)))

      (delete-region (point-min) (point))

      (goto-char (point-max)))))

;;; init-sql.el ends here
