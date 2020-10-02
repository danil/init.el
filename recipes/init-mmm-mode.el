;;; init-mmm-mode.el --- This file is part of Danil <danil@kutkevich.org> home.

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

(add-hook 'after-init-hook 'noxrcp-mmm-mode)

(defun noxrcp-mmm-mode ()
  "My init."

  (require 'mmm-auto)
  (setq mmm-global-mode 'maybe)

  (mmm-add-mode-ext-class 'html-erb-mode "\\.html\\.erb\\'" 'erb)
  (mmm-add-mode-ext-class 'html-erb-mode "\\.js\\.erb\\'" 'ejs)
  (mmm-add-mode-ext-class 'html-erb-mode "\\.jst\\.ejs\\'" 'ejs)

  (mmm-add-mode-ext-class 'html-erb-mode "\\.js\\.erb\\'" 'html-js)

  (mmm-add-mode-ext-class 'html-erb-mode nil 'html-js)
  (mmm-add-mode-ext-class 'html-erb-mode nil 'html-css)

  (add-to-list 'auto-mode-alist '("\\.html\\.erb\\'" . html-erb-mode))
  (add-to-list 'auto-mode-alist '("\\.js\\.erb\\'"  . html-erb-mode))
  (add-to-list 'auto-mode-alist '("\\.jst\\.ejs\\'"  . html-erb-mode)))

;; (autoload 'mmm-add-mode-ext-class "mmm-mode" nil t)

;; (add-hook 'after-init-hook 'noxrcp-mmm-mode)

;; (defun noxrcp-mmm-mode ()
;;   "My init."

;;   (noxrcp-after-load 'mmm-mode
;;     ;; <https://github.com/purcell/emacs.d/blob/master/init-mmm.el>.
;;     (setq mmm-global-mode 'buffers-with-submode-classes)
;;     (setq mmm-submode-decoration-level 2)
;;     ;; (setq mmm-parse-when-idle t)

;;     ;; <https://github.com/purcell/emacs.d/blob/master/init-ruby-mode.el>.
;;     (defun sanityinc/ensure-mmm-erb-loaded ()
;;       (require 'mmm-erb))

;;     (noxrcp-add-mode-to-hooks 'sanityinc/ensure-mmm-erb-loaded
;;                            '(html-mode-hook
;;                              nxml-mode-hook
;;                              yaml-mode-hook))

;;     (dolist (mode (list 'html-mode 'html-erb-mode 'nxml-mode))
;;       (mmm-add-mode-ext-class
;;        mode "\\.r?html\\(\\.erb\\)?\\'" 'html-js)
;;       (mmm-add-mode-ext-class
;;        mode "\\.r?html\\(\\.erb\\)?\\'" 'html-css)
;;       (mmm-add-mode-ext-class
;;        mode "\\.erb\\'" 'erb))

;;     (dolist (mode (list 'js-mode 'js2-mode 'js3-mode))
;;       (mmm-add-mode-ext-class mode "\\.js\\.erb\\'" 'erb))

;;     (mmm-add-mode-ext-class 'html-erb-mode "\\.jst\\.ejs\\'" 'ejs)
;;     (mmm-add-mode-ext-class 'yaml-mode "\\.yaml\\'" 'erb)

;;     (noxrcp-add-mode-to-patterns 'html-erb-mode
;;                                   "\\.jst\\.ejs\\'"
;;                                   "\\.r?html\\'"
;;                                   "\\.r?html\\.erb\\'")))

;;; init-mmm-mode.el ends here
