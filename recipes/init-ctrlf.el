;;; init-ctrlf.el --- This file is part of Danil <danil@kutkevich.org> home.

;; Copyright (C) 2020 Danil <danil@kutkevich.org>.
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

(custom-set-faces
 '(ctrlf-highlight-active
   ((t :background "brightwhite" :foreground "brightred"))))

(add-hook 'after-init-hook 'noxrcp-ctrlf)
(defun noxrcp-ctrlf ()
  "No X recipe init."
  ;; (ctrlf-mode +1)

  (global-set-key (kbd "C-s")   'noxrcp-ctrlf--forward-literal)          ;; isearch-forward                 or ctrlf-forward-literal
  (global-set-key (kbd "C-r")   'noxrcp-ctrlf--backward-literal)         ;; isearch-backward                or ctrlf-backward-literal
  (global-set-key (kbd "C-M-s") 'noxrcp-ctrlf--forward-regexp)           ;; isearch-forward-regexp          or ctrlf-forward-regexp
  (global-set-key (kbd "C-M-r") 'noxrcp-ctrlf--backward-regexp)          ;; isearch-backward-regexp         or ctrlf-backward-regexp
  (global-set-key (kbd "M-s _") 'noxrcp-ctrlf--forward-symbol)           ;; isearch-forward-symbol          or ctrlf-forward-symbol
  (global-set-key (kbd "M-s .") 'noxrcp-ctrlf--forward-symbol-at-point)  ;; isearch-forward-symbol-at-point or ctrlf-forward-symbol-at-point
  )

(defun noxrcp-ctrlf--forward-literal ()
  (interactive)
  (if current-prefix-arg
      (progn (setq current-prefix-arg nil) (ctrlf-forward-literal))
    (isearch-forward)))

(defun noxrcp-ctrlf--backward-literal ()
  (interactive)
  (if current-prefix-arg
      (progn (setq current-prefix-arg nil) (ctrlf-backward-literal))
    (isearch-backward)))

(defun noxrcp-ctrlf--forward-regexp ()
  (interactive)
  (if current-prefix-arg
      (progn (setq current-prefix-arg nil) (ctrlf-forward-regexp))
    (isearch-forward-regexp)))

(defun noxrcp-ctrlf--backward-regexp ()
  (interactive)
  (if current-prefix-arg
      (progn (setq current-prefix-arg nil) (ctrlf-backward-regexp))
    (isearch-backward-regexp)))

(defun noxrcp-ctrlf--forward-symbol ()
  (interactive)
  (if current-prefix-arg
      (progn (setq current-prefix-arg nil) (ctrlf-forward-symbol))
    (isearch-forward-symbol)))

(defun noxrcp-ctrlf--forward-symbol-at-point ()
  (interactive)
  (if current-prefix-arg
      (progn (setq current-prefix-arg nil) (ctrlf-forward-symbol-at-point))
    (isearch-forward-symbol-at-point)))

;;; init-ctrlf.el ends here
