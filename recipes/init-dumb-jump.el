;;; init-dumb-jump.el --- This file is part of Danil <https://danil.kutkevich.org> home.

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

(custom-set-variables
 '(dumb-jump-max-find-time 10)
 '(dumb-jump-selector 'ivy))

(add-hook 'after-init-hook 'noxrcp-dumb-jump)
(defun noxrcp-dumb-jump ()
  "No X recipe init."
  (if (boundp 'dumb-jump-mode-map) (noxrcp-dumb-jump--setup)
    (with-eval-after-load 'dumb-jump (noxrcp-dumb-jump--setup)))
  (dumb-jump-mode))

(defun noxrcp-dumb-jump--setup ()
  (define-key dumb-jump-mode-map (kbd "C-M-g") nil)
  (define-key dumb-jump-mode-map (kbd "C-M-p") nil)
  ;; (define-key dumb-jump-mode-map (nox-kbd "? ?") 'noxrcp-dumb-jump--go)
  (if (boundp 'c-mode-map) (noxrcp-dumb-jump--setup-c-mode)
    (with-eval-after-load 'cc-mode (noxrcp-dumb-jump--setup-c-mode)))
  (if (boundp 'enh-ruby-mode-map) (noxrcp-dumb-jump--setup-enh-ruby-mode)
    (with-eval-after-load 'enh-ruby-mode (noxrcp-dumb-jump--setup-enh-ruby-mode)))
  (if (boundp 'ruby-mode-map) (noxrcp-dumb-jump--setup-ruby-mode)
    (with-eval-after-load 'ruby-mode (noxrcp-dumb-jump--setup-ruby-mode))))

(defun noxrcp-dumb-jump--setup-c-mode ()
  (define-key c-mode-map (kbd "C-c C-j") 'noxrcp-dumb-jump--go))

(defun noxrcp-dumb-jump--setup-enh-ruby-mode ()
  (define-key enh-ruby-mode-map (kbd "C-c C-j") 'noxrcp-dumb-jump--go))

(defun noxrcp-dumb-jump--setup-ruby-mode ()
  (define-key ruby-mode-map (kbd "C-c C-j") 'noxrcp-dumb-jump--go))

(defun noxrcp-dumb-jump--go ()
  (interactive)
  (if (not current-prefix-arg)
      (call-interactively 'noxrcp-dumb-jump---go)
    (let ((current-prefix-arg 'nil))
      (cond
       ((equal current-prefix-arg 4)
        (call-interactively 'xref-find-apropos))
       (t
        (call-interactively 'xref-find-apropos))))))

(defun noxrcp-dumb-jump---go ()
  (interactive)
  (dumb-jump-go)
  (let* ((one-more-repeat t)
         (keynames '("j" "k")))
    (while one-more-repeat
      (message "Dumb jump: `j' jump to the definition; `k' jumps back")
      (let* ((event (read-event))
             (keyname (format-kbd-macro (vector event) nil)))
        (clear-this-command-keys t)
        (if (member keyname keynames)
            (progn
              (cond ((equal keyname "j") (dumb-jump-go))
                    ((equal keyname "k") (dumb-jump-back)))
              (setq last-input-event nil))
          (setq one-more-repeat nil)
          (push last-input-event unread-command-events))))))

;;; init-dumb-jump.el ends here
