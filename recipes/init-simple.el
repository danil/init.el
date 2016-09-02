;;; init-simple.el --- This file is part of Danil <danil@kutkevich.org> home.

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

(add-hook 'after-init-hook 'init-simple)

(defun init-simple ()
  "Init."

  (define-key myinit-map (kbd "l c") 'count-words-region)
  (define-key myinit-map (kbd "l t") 'toggle-truncate-lines)

  ;; (myinit--after-load 'simple
  ;;   ;; (define-key visual-line-mode-map "C-SPC" nil)
  ;;   (define-key special-mode-map " " nil))

  ;; (setq line-number-mode t)

  (setq column-number-mode t) ;column number mode <http://gnu.org/software/emacs/manual/html_node/emacs/Optional-Mode-Line.html>.
  (transient-mark-mode t) ;transient mark mode <http://emacswiki.org/TransientMarkMode>
  )

;;; init-simple.el ends here
