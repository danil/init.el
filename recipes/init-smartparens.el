;;; init-smartparens.el --- This file is part of Danil <danil@kutkevich.org> home.

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

(add-hook 'after-init-hook 'noxrcp-smartparens)

(defun noxrcp-smartparens ()
  "No X recipe init."

  (noxrcp-add-mode-to-hooks (lambda ()
                          (turn-on-smartparens-mode)
                          (turn-on-show-smartparens-mode))
                        '(cider-repl-mode-hook
                          clojure-mode-hook))

  (noxrcp-after-load 'smartparens
    (sp-with-modes sp--lisp-modes (sp-local-pair "'" nil :actions nil)) ;adds `' as a local pair in lisp <https://github.com/Fuco1/smartparens/issues/286#issuecomment-32324743>, <https://github.com/Fuco1/smartparens/wiki/Pair-management#local-pair-definitions>
    (define-key sp-keymap (nox-kbd "m s u") 'sp-unwrap-sexp)
    (define-key sp-keymap (nox-kbd "m s s f") 'sp-forward-slurp-sexp)
    (define-key sp-keymap (nox-kbd "m s s b") 'sp-backward-slurp-sexp)
    (define-key sp-keymap (kbd "M-(") (lambda ()
                                        (interactive)
                                        (sp-wrap-with-pair "(")))
    (define-key sp-keymap (kbd "M-[") (lambda ()
                                        (interactive)
                                        (sp-wrap-with-pair "[")))
    ;; (define-key sp-keymap (kbd "m s s k a") 'sp-splice-sexp-killing-around)
    (define-key sp-keymap (kbd "M-{") (lambda ()
                                        (interactive)
                                        (sp-wrap-with-pair "{")))))

;;; init-smartparens.el ends here
