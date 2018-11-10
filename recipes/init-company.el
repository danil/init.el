;;; init-company.el --- This file is part of Danil <danil@kutkevich.org> home.

;; Copyright (C) 2018 Danil <danil@kutkevich.org>.
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

;; The common sources for all modes
;; <https://github.com/gorakhargosh/emacs.d/blob/master/config-completion.el>.
(custom-set-variables
 ;; '(company-abort-manual-when-too-short nil)
 ;; '(company-backends `(,@(unless (version< "24.3.51" emacs-version))
 ;; '(company-global-modes t)
 ;; '(company-show-numbers nil)
 ;; '(company-tooltip-limit 10)
 ;; '(company-tooltip-margin 1)
 ;; '(company-tooltip-maximum-width most-positive-fixnum)
 ;; '(company-tooltip-minimum 6)
 ;; '(company-tooltip-minimum-width 0)
 ;; '(company-tooltip-offset-display 'scrollbar)
 ;; '(company-lighter-base "company")
 ;; '(company-tooltip-idle-delay nil) ;; .5
 '(company-frontends nil) ;; nil '()
 '(company-idle-delay nil) ;; 0.7 tradeoff between typing speed and performance <https://emacs.stackexchange.com/questions/32467/how-can-i-configure-company-mode-to-only-display-candidates-after-an-explicit-ke#32523>
 '(company-minimum-prefix-length 0))

(add-hook 'after-init-hook 'myinit-company)
(defun myinit-company () "My init." (global-company-mode t))

;;; init-company.el ends here
