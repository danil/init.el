;;; init-robe.el --- This file is part of Danil <danil@kutkevich.org> home.

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

(add-hook 'after-init-hook 'noxrcp-robe)
(defun noxrcp-robe ()
  "No X recipe init."
  (add-hook 'robe-mode-hook 'ac-robe-setup)
  (add-hook 'ruby-mode-hook 'robe-mode)
  (add-hook 'enh-ruby-mode-hook 'robe-mode)
  (if (boundp 'robe-mode-map) (noxrcp-robe--setup)
    (with-eval-after-load 'robe (noxrcp-robe--setup))))

(defun noxrcp-robe--setup ()
  (define-key robe-mode-map (kbd "C-c C-k") 'xref-pop-marker-stack)
  ;; (define-key robe-mode-map (kbd "C-c C-S-k") 'robe-rails-refresh)
  (if (boundp 'enh-ruby-mode-map) (noxrcp-robe--setup-enh-ruby-mode)
    (with-eval-after-load 'enh-ruby-mode (noxrcp-robe--setup-enh-ruby-mode)))
  (if (boundp 'ruby-mode-map) (noxrcp-robe--setup-ruby-mode)
    (with-eval-after-load 'ruby-mode (noxrcp-robe--setup-ruby-mode))))

(defun noxrcp-robe--setup-enh-ruby-mode ()
  (define-key enh-ruby-mode-map (kbd "C-c C-j") 'noxrcp-robe--jump))

(defun noxrcp-robe--setup-ruby-mode ()
  (define-key ruby-mode-map (kbd "C-c C-j") 'noxrcp-robe--jump))

(defun noxrcp-robe--jump ()
  (interactive)
  (if (not current-prefix-arg)
      (call-interactively 'noxrcp-dumb-jump---go)
    (let ((current-prefix-arg 'nil))
      (cond
       ((equal current-prefix-arg 4)
        (call-interactively 'robe-jump))
       (t
        (call-interactively 'robe-jump))))))

;;; init-robe.el ends here
