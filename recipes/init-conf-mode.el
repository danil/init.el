;;; init-conf-mode.el --- This file is part of Danil <danil@kutkevich.org> home.

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

(defcustom noxrcp-conf-mode-patterns '()
  "Regexp patterns associated with `conf-mode'."
  :group 'noxrcp)

(custom-set-variables '(noxrcp-conf-mode-patterns
                        '(
                          ("/Pipfile2\\'"                           conf-mode)
                          ("/Pipfile3\\'"                           conf-mode)
                          ("/Pipfile\\'"                            conf-mode)
                          ("/\\.Xmodmap\\'"                         conf-xdefaults-mode)
                          ("/\\.config/skippy-xd/skippy-xd\\.rc\\'" conf-mode)
                          ("/\\.config/sxhkd/"                      conf-mode)
                          ("/\\.curlrc\\'"                          conf-mode)
                          ("/\\.gtkrc-2.0\\'"                       conf-mode)
                          ("/\\.inputrc\\'"                         conf-mode)
                          ("/\\.moc/keymap\\'"                      conf-mode)
                          ("/\\.npmrc\\'"                           conf-mode)
                          ("/\\.offlineimaprc\\'"                   conf-mode)
                          ("/\\.rvmrc\\'"                           conf-mode)
                          ("/\\.screenrc\\'"                        conf-mode)
                          ("/\\.tigrc\\'"                           conf-mode)
                          ("/conkyrc_calendar\\'"                   conf-mode)
                          ("/conkyrc_top\\'"                        conf-mode)
                          ("/csf\\.allow\\'"                        conf-mode)
                          ("/dunstrc\\'"                            conf-mode)
                          ("/etc/aliases\\'"                        conf-mode)
                          ("/etc/fstab\\'"                          conf-mode)
                          ("/etc/mail/aliases\\'"                   conf-mode)
                          ("/etc/mailutils\\.d/"                    conf-mode)
                          ("/etc/sudoers\\.tmp\\'"                  conf-mode)
                          ("/fail2ban/.*\\.local\\'"                conf-mode)
                          ("/hosts\\'"                              conf-mode)
                          ("/htoprc\\'"                             conf-mode)
                          ("/inventor\\(y\\|ies\\)/[^.]*\\'"        conf-mode)
                          ("/locale\\.gen.pacnew\\'"                conf-mode)
                          ("/locale\\.gen\\'"                       conf-mode)
                          ("/logind\\.conf\\.pacnew\\'"             conf-mode)
                          ("/mailutils\\.rc\\'"                     conf-mode)
                          ("/mimeapps.list\\'"                      conf-mode)
                          ("/mirrorlist\\'"                         conf-mode)
                          ("/mirrorlist\\.pacnew\\'"                conf-mode)
                          ("/monit.d/[^/]*\\'"                      conf-mode)
                          ("/monitrc\\'"                            conf-mode)
                          ("/robots\\.txt\\'"                       conf-mode)
                          ("/rsyncd\\.secrets\\'"                   conf-colon-mode)
                          ("/securetty\\'"                          conf-mode)
                          ("/share/applications/defaults\\.list\\'" conf-mode)
                          ("/shells\\'"                             conf-mode)
                          ("/sshd_config\\'"                        conf-mode)
                          ("/sudoers\\'"                            conf-mode)
                          ("/tint2rc\\'"                            conf-mode)
                          ("\\.SRCINFO\\'"                          conf-mode)
                          ("\\.cnf\\'"                              conf-mode)
                          ("\\.eixrc\\'"                            conf-mode)
                          ("\\.features\\'"                         conf-mode) ; cucumber features
                          ("\\.feed2imaprc\\'"                      conf-mode)
                          ("\\.gtkrc.mine\\'"                       conf-mode)
                          ("\\.ini\\.template\\'"                   conf-unix-mode)
                          ("\\.pgpass\\'"                           conf-colon-mode)
                          ("\\.pkla\\'"                             conf-mode)
                          ("\\.skippyrc\\'"                         conf-mode)
                          ("\\.stalonetrayrc\\'"                    conf-mode)
                          ("\\.theme\\'"                            conf-mode)
                          ("\\.xxkbrc\\'"                           conf-mode)
                          ("\\parcelliterc\\'"                      conf-mode)
                          ("\\torrc\\'"                             conf-mode)

                          ;; Logrotate scripts
                          ("/etc/logrotate\\.d/" conf-mode)
                          ("\\.logrotate\\'"     conf-mode)

                          ;; Exim configs
                          ("/system_filter\\.exim\\'"         conf-mode)
                          ("/passwd\\.client\\'"              conf-mode)
                          ("/exim\\.conf\\.dist\\'"           conf-mode)
                          ("/exim4\\.conf\\.localmacros\\'"   conf-mode)

                          ;; Gentoo configs
                          ("/etc/conf\\.d/"                     conf-mode)
                          ("/etc/eixrc/"                        conf-mode)
                          ("/etc/env\\.d/"                      conf-mode)
                          ("/etc/fcron/"                        conf-mode)
                          ("/etc/portage/env/"                  conf-mode)
                          ("/etc/portage/package\\..*\\'"       conf-mode)
                          ("/etc/portage/profile/use\\.mask\\'" conf-mode)
                          ("/etc/portage/sets/"                 conf-mode)
                          ("/portage/package\\.license\\'"      conf-mode)
                          ("/profiles/categories\\'"            conf-mode)
                          ("/profiles/package\\.mask\\'"          conf-mode)
                          ("/profiles/repo_name\\'"             conf-mode)
                          ("/var/lib/portage/world_sets\\'"     conf-mode)
                          ("\\world\\'"                         conf-mode)
                          )))

(add-hook 'after-init-hook 'noxrcp-conf-mode)
(defun noxrcp-conf-mode ()
  "No X recipe init."

  (dolist (pattern-mode-pair noxrcp-conf-mode-patterns)
    (let ((pattern (nth 0 pattern-mode-pair))
          (mode (nth 1 pattern-mode-pair)))
      (add-to-list 'auto-mode-alist (cons pattern mode)))))

(defun noxrcp-conf-colon-mode--rainbow-identifiers-init ()
  (when (equal major-mode 'conf-colon-mode)
    (noxrcp-conf-mode--rainbow-identifiers-init)

    (add-hook 'rainbow-identifiers-filter-functions
              'noxrcp-conf-colon-mode--rainbow-identifiers-filter)

    (noxrcp-rainbow-identifiers--lazyinit)))

(defun noxrcp-conf-space-mode--rainbow-identifiers-init ()
  (when (equal major-mode 'conf-space-mode)
    (noxrcp-conf-mode--rainbow-identifiers-init)
    (noxrcp-rainbow-identifiers--lazyinit)))

(defun noxrcp-conf-unix-mode--rainbow-identifiers-init ()
  (when (equal major-mode 'conf-unix-mode)
    (noxrcp-conf-mode--rainbow-identifiers-init)
    (noxrcp-rainbow-identifiers--lazyinit)))

(defun noxrcp-conf-xdefaults-mode--rainbow-identifiers-init ()
  (when (equal major-mode 'conf-xdefaults-mode)
    (noxrcp-conf-mode--rainbow-identifiers-init)

    (add-hook 'rainbow-identifiers-filter-functions
              'noxrcp-conf-colon-mode--rainbow-identifiers-filter)

    (noxrcp-rainbow-identifiers--lazyinit)))

(defun noxrcp-conf-mode--rainbow-identifiers-init ()
  (make-local-variable 'rainbow-identifiers-filter-functions)
  (add-hook 'rainbow-identifiers-filter-functions
            'noxrcp-rainbow-identifiers--face-overridable)

  (make-local-variable 'rainbow-identifiers-faces-to-override)
  (setq rainbow-identifiers-faces-to-override '(font-lock-variable-name-face)))

;; <http://amitp.blogspot.ru/2014/09/emacs-rainbow-identifiers-customized.html>.
(defun noxrcp-conf-colon-mode--rainbow-identifiers-filter (beg end)
  (let ((str-after (buffer-substring-no-properties end (point-max))))
    (string-match-p "\\`:[[:space:]]*[^[:space:]]+$" str-after)))

;;; init-conf-mode.el ends here
