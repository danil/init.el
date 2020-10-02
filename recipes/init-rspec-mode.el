;;; init-rspec-mode.el --- This file is part of Danil <danil@kutkevich.org> home.

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

(defcustom noxrcp-rspec-mode-patterns '()
  "Regexp patterns associated with `rspec-mode'."
  :group 'noxrcp)

(custom-set-variables '(noxrcp-rspec-mode-patterns
                        '(
                          "_spec\\.rb\\'"
                          "/spec[0-9]*\\.rb\\'"
                          )))

(add-hook 'after-init-hook 'noxrcp-rspec-mode)
(defun noxrcp-rspec-mode ()
  "My init."
  ;; (add-hook 'dired-mode-hook 'rspec-dired-mode)
  ;; (dolist (hook noxrcp-rspec-mode-patterns)
  ;;   (add-hook hook 'noxrcp-rspec-mode--lazyinit))
  (custom-set-variables '(rspec-use-spring-when-possible nil))
  (noxrcp-after-load 'rspec-mode
    ;; (setq rspec-use-rvm t)
    (setq rspec-use-rake-when-possible nil)))

(defun noxrcp-rspec-mode--lazyinit ()
  "Run `highlight-symbol'."
  (noxrcp-run-with-idle-timer-in-current-buffer
   noxrcp-default-idle-timer-seconds nil (lambda () (rspec-mode t))))

;;; init-rspec-mode.el ends here
