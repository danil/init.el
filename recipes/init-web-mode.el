;;; init-web-mode.el --- This file is part of Danil <danil@kutkevich.org> home.

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

;; ;; For better jsx syntax-highlighting in web-mode
;; ;; - courtesy of Patrick @halbtuerke.
;; (defadvice web-mode-highlight-part (around tweak-jsx activate)
;;   (if (equal web-mode-content-type "jsx")
;;       (let ((web-mode-enable-part-face nil))
;;         ad-do-it)
;;     ad-do-it))

(defcustom myinit-web-mode-patterns '()
  "Regexp patterns associated with `web-mode'."
  :group 'myinit)

(custom-set-variables '(myinit-web-mode-patterns
                        '(
                          "/src/vendor/narus/narus-web/.+\\.jsx?\\'"
                          "\\.\\(html\\|text\\)\\.erb\\'"
                          "\\.as[cp]x\\'"
                          "\\.djhtml\\'"
                          "\\.ejs\\'"
                          "\\.html\\'"
                          "\\.js.erb\\'"
                          "\\.jsp\\'"
                          "\\.jst\\.ejs\\'"
                          "\\.jsx\\'"
                          "\\.phtml\\'"
                          "\\.rhtml\\'"
                          "\\.tpl\\.php\\'"
                          )))

(add-hook 'after-init-hook 'myinit-web-mode)

(defun myinit-web-mode ()
  "My init."

  (dolist (pattern myinit-web-mode-patterns)
    (add-to-list 'auto-mode-alist (cons pattern 'web-mode)))

  (add-hook 'web-mode-hook 'myinit-web-mode--armor5games-settings)

  (myinit-after-load 'web-mode
    ;; (define-key web-mode-map (kbd "C-c C-f") nil)
    (setq web-mode-content-types-alist '(("jsx" . "\\.js[x]?\\'")))))


(defun myinit-web-mode--armor5games-settings ()
  "Custom Armor5games settings."

  (when (and (buffer-file-name)
             (string-match "/armor5games/" (buffer-file-name)))
    (setq standard-indent 4)
    (setq web-mode-code-indent-offset 4)
    (setq web-mode-indent-style 4)
    (setq web-mode-markup-indent-offset 4)))

;;; init-web-mode.el ends here
