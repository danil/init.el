;;; init-conf-mode.el --- This file is part of Danil <danil@kutkevich.org> home.

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

(defcustom noxrcp-conf-mode-patterns '()
  "Regexp patterns associated with `conf-mode'."
  :group 'noxrcp)

(custom-set-variables '(noxrcp-conf-mode-patterns
                        '(
                          "/.config/sxhkd/"
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
                          "/csf.allow\\'"
                          "/dunstrc\\'"
                          "/etc/aliases\\'"
                          "/etc/fstab\\'"
                          "/etc/mail/aliases\\'"
                          "/etc/mailutils\\.d/"
                          "/etc/sudoers\\.tmp\\'"
                          "/fail2ban/.*\\.local\\'"
                          "/hosts\\'"
                          "/htoprc\\'"
                          "/inventor\\(y\\|ies\\)/[^.]*\\'"
                          "/locale.gen\\'"
                          "/mailutils\\.rc\\'"
                          "/mimeapps.list\\'"
                          "/monit.d/[^/]*\\'"
                          "/monitrc\\'"
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
                          "\\torrc\\'"
                          )))

(add-hook 'after-init-hook 'noxrcp-conf-mode)
(defun noxrcp-conf-mode ()
  "No X recipe init."
  (dolist (pattern noxrcp-conf-mode-patterns)
    (add-to-list 'auto-mode-alist (cons pattern 'conf-mode)))

  ;; Logrotate scripts.
  (dolist (pattern '("/etc/logrotate\\.d/" "\\.logrotate\\'"))
    (add-to-list 'auto-mode-alist (cons pattern 'conf-mode)))

  ;; Gentoo configs.
  (dolist (pattern '("/etc/conf\\.d/"
                     "/etc/eixrc/"
                     "/etc/env\\.d/"
                     "/etc/fcron/"
                     "/etc/portage/env/"
                     "/etc/portage/package\\..*\\'"
                     "/etc/portage/profile/use\\.mask\\'"
                     "/etc/portage/sets/"
                     "/portage/package\\.license\\'"
                     "/profiles/categories\\'"
                     "/profiles/package.mask\\'"
                     "/profiles/repo_name\\'"
                     "/var/lib/portage/world_sets\\'"
                     "\\world\\'"))
    (add-to-list 'auto-mode-alist (cons pattern 'conf-mode)))

  (dolist (pattern '("\\.ini\\.template\\'"))
    (add-to-list 'auto-mode-alist (cons pattern 'conf-unix-mode)))

  (dolist (pattern '("/\\.Xmodmap\\'"))
    (add-to-list 'auto-mode-alist (cons pattern 'conf-xdefaults-mode)))

  (dolist (pattern '("/rsyncd.secrets\\'" "\\.pgpass\\'"))
    (add-to-list 'auto-mode-alist (cons pattern 'conf-colon-mode))))

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
