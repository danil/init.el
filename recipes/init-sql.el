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

(add-hook 'after-init-hook 'init-sql)

(defun init-sql ()
  "Init."

  (add-hook 'sql-interactive-mode-hook 'my-sql-save-history-hook)

  (my-init--after-load 'sql
    (define-key sql-interactive-mode-map (my-kbd "C-l") 'my-sql-shell-clear)))

(defun my-sql-shell-clear (&optional arg)
  "Delete output from `SQl' shell or kill output from `SQL' shell if `ARG'.
Clear current `SQL' shell beginning with a-la prompt to `point-min'.
Clearing by `delete-region' or by `kill-region' if `ARG'."

  (interactive "P")
  (goto-char (point-max))
  (search-backward "=#")
  (beginning-of-line)

  (if arg
      (kill-region (point-min) (point))
    (delete-region (point-min) (point)))

  (delete-region (point-min) (point))

  (goto-char (point-max)))

;; Sql mode history <http://www.emacswiki.org/emacs/SqlMode#toc3>.
(defun my-sql-save-history-hook ()
  (let ((lval 'sql-input-ring-file-name)
        (rval 'sql-product))
    (if (symbol-value rval)
        (let ((filename
               (concat "~/.emacs.d/sql/"
                       (symbol-name (symbol-value rval))
                       "-history.sql")))
          (set (make-local-variable lval) filename))
      (error
       (format "SQL history will not be saved because %s is nil"
               (symbol-name rval))))))

;;; init-sql.el ends here
