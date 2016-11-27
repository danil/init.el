;;; init-flycheck-bashate.el --- This file is part of Danil <danil@kutkevich.org> home.

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

;; (with-eval-after-load 'flycheck
;;   (require 'flycheck-bashate)
;;   (flycheck-bashate-setup))

;; (add-hook 'after-init-hook 'myinit-flycheck-bashate)
;; (defun myinit-flycheck-bashate ()
;;   "My init."
;;   )

(with-eval-after-load 'flycheck
  (flycheck-def-option-var flycheck-bashate-ignored-tests
      '("E006") bashate
    "A list of tests to ignore by bashate."
    :type '(repeat :tag "Warnings" (string :tag "Test name"))
    :safe #'flycheck-string-list-p
    :package-version '(flycheck . "0.20"))

  (flycheck-define-checker bashate
    "A checker using bashate.

See `https://github.com/alexmurray/bashate/'."
    :command ("bashate"
              (option "--ignore=" flycheck-bashate-ignored-tests concat
                           flycheck-option-comma-separated-list)
              source)
    :error-patterns ((error line-start "[E] "(message (minimal-match (one-or-more not-newline))) ": '" (one-or-more not-newline) "'\n"
                            " - " (file-name) " : L" line line-end)
                     (warning line-start "[W] "(message (minimal-match (one-or-more not-newline))) ": '" (one-or-more not-newline) "'\n"
                              " - " (file-name) " : L" line line-end))
    :modes sh-mode
    :next-checkers ((warning . sh-shellcheck)))

  (add-to-list 'flycheck-checkers 'bashate))

;;; init-flycheck-bashate.el ends here
