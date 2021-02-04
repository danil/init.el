;;; init-nodejs-repl.el --- This file is part of Danil <https://danil.kutkevich.org> home.

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

(add-hook 'after-init-hook 'noxrcp-nodejs-repl)

(defun noxrcp-nodejs-repl ()
  "No X recipe init."

  ;; (custom-set-variables '(nodejs-repl-command "~/.nvm/v0.11.13/bin/node"))

  (if (boundp 'js-mode-map) (init-nodejs-repl-xxxxxxxxxx)
    (with-eval-after-load 'js (init-nodejs-repl-xxxxxxxxxx)))

  (if (boundp 'js2-mode-map) (init-nodejs-repl-yyyyyyyyyy)
    (with-eval-after-load 'js2-mode (init-nodejs-repl-yyyyyyyyyy)))

  (init-comint-create-history-fn "noxrcp-nodejs-repl--turn-on-history"
                                    "~/.node_repl_history")
  (add-hook 'nodejs-repl-mode-hook 'noxrcp-nodejs-repl--turn-on-history))

(defun init-nodejs-repl-xxxxxxxxxx ()
  (define-key js-mode-map (kbd "C-c C-z") 'nodejs-repl))

(defun init-nodejs-repl-yyyyyyyyyy ()
  (define-key js2-mode-map (kbd "C-c C-z") 'nodejs-repl))

;;; init-nodejs-repl.el ends here
