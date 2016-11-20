;;; init-flycheck-gometalinter.el --- This file is part of Danil <danil@kutkevich.org> home.

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

(with-eval-after-load 'flycheck
  (flycheck-gometalinter-setup)

  ;; (setq flycheck-gometalinter-fast t) ;only run fast linters
  ;; (setq flycheck-gometalinter-disable-linters '("gotype" "gocyclo")) ;disable linters
  ;; (setq flycheck-gometalinter-deadline "10s") ;set different deadline (default: 5s)

  (setq flycheck-gometalinter-disable-all t) ;only enable selected linters
  (setq flycheck-gometalinter-enable-linters '(
                                               ;; "gocyclo"
                                               "aligncheck"
                                               "deadcode"
                                               "dupl"
                                               "goconst"
                                               "golint"
                                               "gosimple"
                                               "gotype"
                                               "ineffassign"
                                               "interfacer"
                                               "staticcheck"
                                               "structcheck"
                                               "varcheck"
                                               ))
  (setq flycheck-gometalinter-vendor t) ;skips 'vendor' directories and sets GO15VENDOREXPERIMENT=1
  (setq flycheck-gometalinter-test t) ;use in tests files
  )

;;; init-flycheck-gometalinter.el ends here
