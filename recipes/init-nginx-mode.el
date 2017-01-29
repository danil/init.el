;;; init-nginx-mode.el --- This file is part of Danil <danil@kutkevich.org> home.

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

(custom-set-variables '(nginx-indent-level 2))

(add-hook 'after-init-hook 'myinit-nginx-mode)

(defun myinit-nginx-mode ()
  "My init."

  (myinit-add-mode-to-patterns 'nginx-mode
                                "/etc/nginx/.*\\.conf\\'"
                                "/etc/nginx/sites-available/"))

(defun myinit-nginx-mode--rainbow-identifiers-init ()
  (when (equal major-mode 'nginx-mode)
    (make-local-variable 'rainbow-identifiers-filter-functions)
    (add-hook 'rainbow-identifiers-filter-functions
              'rainbow-identifiers-face-overridable)
    (add-hook 'rainbow-identifiers-filter-functions
              'myinit-nginx-mode--rainbow-identifiers-filter)

    (make-local-variable 'rainbow-identifiers-faces-to-override)
    (setq rainbow-identifiers-faces-to-override '(font-lock-keyword-face))

    (myinit-rainbow-identifiers--lazyinit)))

;; <http://amitp.blogspot.ru/2014/09/emacs-rainbow-identifiers-customized.html>.
(defun myinit-nginx-mode--rainbow-identifiers-filter (beg end)
  (let ((current-identifier (buffer-substring-no-properties beg end)))
    (member current-identifier '(
                                 "access_log"
                                 "autoindex"
                                 "break"
                                 "client_max_body_size"
                                 "default_type"
                                 "deny"
                                 "error_log"
                                 "error_page"
                                 "expires"
                                 "fastcgi_index"
                                 "fastcgi_param"
                                 "fastcgi_pass"
                                 "gzip_min_length"
                                 "gzip_vary"
                                 "if"
                                 "keepalive_timeout"
                                 "listen"
                                 "location"
                                 "proxy_pass"
                                 "proxy_redirect"
                                 "proxy_set_header"
                                 "return"
                                 "rewrite"
                                 "root"
                                 "server"
                                 "server_name"
                                 "set"
                                 "try_files"
                                 "upstream"
                                 ))))

;;; init-nginx-mode.el ends here
