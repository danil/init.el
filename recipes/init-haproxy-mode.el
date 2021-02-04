;;; init-haproxy-mode.el --- This file is part of Danil <https://danil.kutkevich.org> home.

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

(defcustom noxrcp-haproxy-mode-patterns '()
  "Regexp patterns associated with `haproxy-mod'."
  :group 'noxinit)

(custom-set-variables
 '(noxrcp-haproxy-mode-patterns '(
                                  "/haproxy.*\\.\\(erb\\|cfg\\)\'"
                                  "haproxy/.*\\(erb\\|cfg\\)\\'"
                                  )))

(add-hook 'after-init-hook 'noxrcp-haproxy-mode)

(defun noxrcp-haproxy-mode ()
  "No X recipe init."

  (dolist (pattern noxrcp-haproxy-mode-patterns)
    (add-to-list 'auto-mode-alist (cons pattern 'haproxy-mode))))

(defun init-haproxy-mode-rainbow-identifiers-setup ()
  (when (equal major-mode 'haproxy-mode)
    (make-local-variable 'rainbow-identifiers-filter-functions)
    (add-hook 'rainbow-identifiers-filter-functions
              'init-rainbow-identifiers-face-overridable)

    (make-local-variable 'rainbow-identifiers-faces-to-override)
    (setq rainbow-identifiers-faces-to-override '(font-lock-keyword-face))

    (init-rainbow-identifiers--lazy-setup)))

;;; <https://github.com/XANi/config/blob/master/modules/emacs/files/parts/haproxy-mode.el>.
(define-generic-mode 'haproxy-mode
  '(?#)
  '(;; keywords
    ;;  "acl"
    "appsession"
    "backlog"
    "balance"
    "bind"
    "bind-process"
                                        ;  "block"
    "capture cookie"
    "capture request header"
    "capture response header"
    "chroot"
    "clitimeout"
    "compression"
    "contimeout"
    "cookie"
    "daemon"
    ;;  "default-server"
    ;;  "default_backend"
    ;;  "description"
    "disabled"
    "dispatch"
    "enabled"
    "errorfile"
    "errorloc"
    "errorloc302"
    "errorloc303"
    "force-persist"
    "fullconn"
    "grace"
    "group"
    "hash-type"
    "http-check disable-on-404"
    "http-check expect"
    "http-check send-state"
    "http-check"
    "http-request"
    "http-response"
    "http-send-name-header"
    "id"
    "ignore-persist"
    "log"
    "max-keep-alive-queue"
    "maxconn"
    "mode"
    "monitor fail"
    "monitor-net"
    "monitor-uri"
    "nbproc"
    "option abortonclose"
    "option accept-invalid-http-request"
    "option accept-invalid-http-response"
    "option allbackups"
    "option checkcache"
    "option clitcpka"
    "option contstats"
    "option dontlog-normal"
    "option dontlognull"
    "option forceclose"
    "option forwardfor"
    "option http-keep-alive"
    "option http-no-delay"
    "option http-pretend-keepalive"
    "option http-server-close"
    "option http-tunnel"
    "option http-use-proxy-header"
    "option http_proxy"
    "option httpchk"
    "option httpclose"
    "option httplog"
    "option independent-streams"
    "option ldap-check"
    "option log-health-checks"
    "option log-separate-errors"
    "option logasap"
    "option mysql-check"
    "option nolinger"
    "option originalto"
    "option persist"
    "option pgsql-check"
    "option redis-check"
    "option redispatch"
    "option smtpchk"
    "option socket-stats"
    "option splice-auto"
    "option splice-request"
    "option splice-response"
    "option srvtcpka"
    "option ssl-hello-chk"
    "option tcp-check"
    "option tcp-smart-accept"
    "option tcp-smart-connect"
    "option tcpka"
    "option tcplog"
    "option transparent"
    "option"
    "persist rdp-cookie"
    "quiet"
    "rate-limit sessions"
    "redirect"
    "redisp"
    "redispatch"
    "reqadd"
    "reqallow"
    "reqdel"
    "reqdeny"
    "reqiallow"
    "reqidel"
    "reqideny"
    "reqipass"
    "reqirep"
    "reqisetbe"
    "reqitarpit"
    "reqpass"
    "reqrep"
    "reqsetbe"
    "reqtarpit"
    "retries"
    "rspadd"
    "rspdel"
    "rspdeny"
    "rspidel"
    "rspideny"
    "rspirep"
    "rsprep"
                                        ;  "server"
    "source"
    "srvtimeout"
    "stats admin"
    "stats auth"
    "stats enable"
    "stats hide-version"
    "stats http-request"
    "stats realm"
    "stats refresh"
    "stats scope"
    "stats show-desc"
    "stats show-legends"
    "stats show-node"
    "stats uri"
    ;;  "stats"
    "stick match"
    "stick on"
    "stick store-request"
    "stick store-response"
    "stick-table"
    "tcp-check connect"
    "tcp-check expect"
    "tcp-check send"
    "tcp-check send-binary"
    "tcp-request connection"
    "tcp-request content"
    "tcp-request inspect-delay"
    "tcp-response content"
    "tcp-response inspect-delay"
    "timeout check"
    "timeout client"
    "timeout client-fin"
    "timeout clitimeout"
    "timeout connect"
    "timeout contimeout"
    "timeout http-keep-alive"
    "timeout http-request"
    "timeout queue"
    "timeout server"
    "timeout server-fin"
    "timeout srvtimeout"
    "timeout tarpit"
    "timeout tunnel"
    "timeout"
    "transparent"
    "unique-id-format"
    "unique-id-header"
    "user"
    ;;  "use_backend"
    "use-server")
  '(
    ("\\(^\s+\\|^\\)\\(frontend\\|listen\\|backend\\|defaults\\|global\\|description\\).*" . 'font-lock-constant-face)
    ;;   ("\\(option\\)" . 'font-lock-keyword-face)
    ("\\(if\\|unless\\|\s-[a-zA-Z]\s\\)" . 'font-lock-string-face)
    ("\\(acl\s+[0-9a-zA-Z_\\-]*\\)" . 'font-lock-builtin-face)
    ;;   ("\\^.+" . 'font-lock-keyword-face)
    ("\\(use_backend\\|default-server\\|server\\)" . font-lock-variable-name-face)
    ("\\(block\\|capture\\|stats\\|default_backend\\)" . font-lock-type-face)
    )
  '(".*/haproxy.*\\.\\(erb\\|cfg\\)")
  nil
  "Generic mode for HAProxy files.")

(provide 'haproxy-mode)

;;; init-haproxy-mode.el ends here
