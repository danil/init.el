;;; init-flycheck.el --- This file is part of Danil <https://danil.kutkevich.org> home.

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

(custom-set-variables
 '(flycheck-disabled-checkers '(
                                go-gofmt
                                go-golint
                                go-vet
                                go-build
                                go-test
                                go-errcheck
                                go-unconvert
                                go-megacheck

                                json-python-json ; ruby slower than javascript
                                markdown-mdl ; ruby slower than javascript
                                proselint ; slow python/javascript

                                ruby-reek ; annoying errors and undocumented config
                                ruby-rubylint

                                sh-bash
                                sh-posix-bash

                                ;; yaml-jsyaml ; annoying errors
                                yaml-ruby ; i use a yaml-javascript linter so as not to set a ruby linter for each ruby version
                                yaml-yamllint ; i use a yaml-javascript linter
                                ))
 ;; '(flycheck-check-syntax-automatically '(idle-change))
 '(flycheck-indication-mode nil)
 '(flycheck-markdown-markdownlint-cli-config "~/.markdownlint.json")
 '(flycheck-mode-line-prefix "F")
 '(flycheck-idle-change-delay 1.5))

(add-hook 'after-init-hook 'noxrcp-flycheck)
(defun noxrcp-flycheck ()
  "No X recipe init."
  (dolist (hook noxrcp-programming-modes-hooks)
    (add-hook hook 'noxrcp-flycheck--lazyinit)))

(with-eval-after-load 'flycheck
  ;; ;; Disable jshint since we prefer eslint checking.
  ;; (setq-default flycheck-disabled-checkers
  ;;               (append flycheck-disabled-checkers
  ;;                       '(javascript-jshint)))
  ;; ;; Disable json-jsonlist checking for json files.
  ;; (setq-default flycheck-disabled-checkers
  ;;               (append flycheck-disabled-checkers
  ;;                       '(json-jsonlist)))
  ;; (set-face-attribute 'flycheck-warning nil :underline nil)
  ;; (flycheck-add-mode 'javascript-eslint 'web-mode)
  (setq flycheck-go-vet-shadow t))

(defun noxrcp-flycheck--lazyinit ()
  "Run `flycheck'."
  (noxrcp-run-with-idle-timer-in-current-buffer
   noxrcp-default-idle-timer-seconds nil 'flycheck-mode))

;;; init-flycheck.el ends here
