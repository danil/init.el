;;; init-flycheck.el --- This file is part of Danil <danil@kutkevich.org> home.

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

(custom-set-variables '(flycheck-disabled-checkers '(
                                                     go-build
                                                     go-errcheck
                                                     go-gofmt
                                                     go-golint
                                                     go-test
                                                     go-unconvert
                                                     go-vet

                                                     ruby-rubylint

                                                     sh-bash
                                                     sh-posix-bash
                                                     ))
                      '(flycheck-idle-change-delay 1.5))

(add-hook 'after-init-hook 'myinit-flycheck)

(defun myinit-flycheck ()
  "My init."

  (myinit-add-mode-to-hooks 'flycheck-mode myinit-programming-modes-hooks))

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

;;; init-flycheck.el ends here
