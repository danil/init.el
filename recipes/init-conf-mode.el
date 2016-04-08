;;; init-conf-mode.el --- This file is part of Danil <danil@kutkevich.org> home.

;; Copyright (C) 2016 Danil <danil@kutkevich.org>.
;; Author: Danil <danil@kutkevich.org>
;; Version: 0.0.1
;; Package-Requires: ((my-init))
;; Keywords: convenience
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

(my-init--hook
  (my-init--add-mode-to-patterns 'conf-mode
                                "/Pipfile2\\'"
                                "/Pipfile3\\'"
                                "/Pipfile\\'"
                                "/\\.config/skippy-xd/skippy-xd\\.rc\\'"
                                "/\\.curlrc\\'"
                                "/\\.gtkrc-2.0\\'"
                                "/\\.inputrc\\'"
                                "/\\.moc/keymap\\'"
                                "/\\.npmrc\\'"
                                "/\\.offlineimaprc\\'"
                                "/\\.rvmrc\\'"
                                "/\\.screenrc\\'"
                                "/\\.tigrc\\'"
                                "/conkyrc_calendar\\'"
                                "/conkyrc_top\\'"
                                "/dunstrc\\'"
                                "/etc/fstab\\'"
                                "/etc/mail/aliases\\'"
                                "/etc/mailutils\\.d/"
                                "/fail2ban/.*\\.local\\'"
                                "/hosts\\'"
                                "/htoprc\\'"
                                "/locale.gen\\'"
                                "/mailutils\\.rc\\'"
                                "/mimeapps.list\\'"
                                "/robots.txt\\'"
                                "/securetty\\'"
                                "/share/applications/defaults\\.list\\'"
                                "/sshd_config\\'"
                                "/sudoers\\'"
                                "/tint2rc\\'"
                                "\\.cnf\\'"
                                "\\.eixrc\\'"
                                "\\.features\\'" ;cucumber features
                                "\\.feed2imaprc\\'"
                                "\\.gtkrc.mine\\'"
                                "\\.pkla\\'"
                                "\\.skippyrc\\'"
                                "\\.stalonetrayrc\\'"
                                "\\.theme\\'"
                                "\\.xxkbrc\\'"
                                "\\parcelliterc\\'"
                                "\\torrc\\'")

  ;; Logrotate scripts.
  (my-init--add-mode-to-patterns 'conf-mode
                                "/etc/logrotate\\.d/"
                                "\\.logrotate\\'")

  ;; Gentoo configs.
  (my-init--add-mode-to-patterns 'conf-mode
                                "/etc/conf\\.d/"
                                "/etc/eixrc/"
                                "/etc/env\\.d/"
                                "/etc/portage/env/"
                                "/etc/portage/package\\..*\\'"
                                "/etc/portage/profile/use\\.mask\\'"
                                "/etc/portage/sets/"
                                "/portage/package\\.license\\'"
                                "/profiles/categories\\'"
                                "/profiles/package.mask\\'"
                                "/profiles/repo_name\\'"
                                "/var/lib/portage/world_sets\\'"
                                "\\world\\'")

  (my-init--add-mode-to-patterns 'conf-xdefaults-mode "/\\.Xmodmap\\'")

  (my-init--add-mode-to-patterns 'conf-colon-mode
                                "/rsyncd.secrets\\'"
                                "\\.pgpass\\'"))

;;; init-conf-mode.el ends here
