;;; init-ac-html.el --- This file is part of Danil <danil@kutkevich.org> home.

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

(add-hook 'after-init-hook 'noxrcp-ac-html)

(defun noxrcp-ac-html ()
  "My init."

  ;; (noxrcp-add-mode-to-hooks (lambda ()
  ;;                         (require 'ac-html)
  ;;                         (require 'ac-html-default-data-provider)
  ;;                         (ac-html-enable-data-provider 'ac-html-default-data-provider)
  ;;                         (ac-html-setup)
  ;;                         (setq ac-sources '(ac-source-html-tag
  ;;                                            ac-source-html-attr
  ;;                                            ac-source-html-attrv))
  ;;                         (auto-complete-mode))

  ;;                       '(html-mode-hook web-mode-hook))

  ;; (add-hook 'haml-mode-hook
  ;;           (lambda ()
  ;;             (require 'ac-haml) ;require ac-haml since we are setup haml auto completion
  ;;             (require 'ac-html-default-data-provider) ;require default data provider if you want to use
  ;;             (ac-html-enable-data-provider 'ac-html-default-data-provider) ;enable data providers, currently only default data provider available
  ;;             (ac-haml-setup) ;let ac-haml do some setup
  ;;             (setq ac-sources '(ac-source-haml-tag
  ;;                                ac-source-haml-attr
  ;;                                ac-source-haml-attrv)) ;set your ac-source
  ;;             ;; Enable auto complete mode.
  ;;             (auto-complete-mode)))

  ;; (add-hook 'jade-mode-hook
  ;;           (lambda ()
  ;;             (require 'ac-jade)
  ;;             (require 'ac-html-default-data-provider)
  ;;             (ac-html-enable-data-provider 'ac-html-default-data-provider)
  ;;             (ac-jade-setup)
  ;;             (setq ac-sources '(ac-source-jade-tag
  ;;                                ac-source-jade-attr
  ;;                                ac-source-jade-attrv))
  ;;             (auto-complete-mode)))

  ;; (add-hook 'slim-mode-hook
  ;;           (lambda ()
  ;;             (require 'ac-slim)
  ;;             (require 'ac-html-default-data-provider)
  ;;             (ac-html-enable-data-provider 'ac-html-default-data-provider)
  ;;             (ac-slim-setup)
  ;;             (setq ac-sources '(ac-source-slim-tag
  ;;                                ac-source-slim-attr
  ;;                                ac-source-slim-attrv))
  ;;             (auto-complete-mode)))

  (add-hook 'haml-mode-hook 'ac-haml-enable)
  (add-hook 'jade-mode-hook 'ac-jade-enable)
  (add-hook 'slim-mode-hook 'ac-slim-enable)
  (noxrcp-add-mode-to-hooks 'ac-html-enable '(html-mode-hook web-mode-hook)))

;;; init-ac-html.el ends here
