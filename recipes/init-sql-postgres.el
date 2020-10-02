;;; init-sql-postgres.el --- This file is part of Danil <danil@kutkevich.org> home.

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

(custom-set-variables
 ;; '(sql-postgres-program "psql95")
 '(sql-postgres-login-params (quote ((user :default "danil")
                                     (database :default "danil")
                                     (port :default 5432)
                                     ;; password ;password prompt do not work :( use instead `~/.pgpass` <http://stackoverflow.com/questions/26677909/emacs-sql-mode-postgresql-and-inputing-password#26743233>, <https://wiki.postgresql.org/wiki/Pgpass>, <http://www.postgresql.org/docs/current/static/libpq-pgpass.html>
                                     server))))

(add-hook 'after-init-hook 'noxrcp-sql-postgres)

(defun noxrcp-sql-postgres ()
  (if (fboundp 'sql-set-product-feature)
      (noxrcp-sql-postgres--prompt)
    (add-hook 'sql-interactive-mode-hook 'noxrcp-sql-postgres--prompt)))

(defun noxrcp-sql-postgres--prompt ()
  ;; <https://unix.stackexchange.com/questions/233518/mariadb-client-has-no-prompt-in-emacs-sql-mode>.
  ;; (sql-set-product-feature 'postgres :prompt-cont-regexp "^\[a-zA-Z_\]*\[-(\]\[#>\] ")
  ;; (sql-set-product-feature 'postgres :prompt-length 20)
  (sql-set-product-feature 'postgres :prompt-regexp "^\[a-zA-Z0-9_\]*\[=-\]\[#>\] "))

;;; init-sql-postgres.el ends here
