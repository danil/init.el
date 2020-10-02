;;; init-ansi-color.el --- This file is part of Danil <danil@kutkevich.org> home.

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

(add-hook 'after-init-hook 'noxrcp-ansi-color)

(defun noxrcp-ansi-color ()
  "No X recipe init."

  (require 'ansi-color)

  ;; AnsiColor (Emacs terminal related stuff)
  ;; <http://emacswiki.org/AnsiColor>.
  (add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
  ;; (add-hook 'shell-mode-hook 'compilation-shell-minor-mode) ;filenames with line numbers linkable

  ;; ANSI SGR (Select Graphic Rendition) escape sequences
  ;; <http://www.emacswiki.org/emacs/AnsiColor>

  (defun my-show-ansi-color ()
    "Process ANSI color codes in region."
    (interactive)
    (ansi-color-apply-on-region (region-beginning) (region-end)))

  ;; ANSI SRG in shell command output
  ;; <http://stackoverflow.com/questions/5819719/emacs-shell-command-output-not-showing-ansi-colors-but-the-code#5821668
  (defadvice display-message-or-buffer (before ansi-color activate)
    "Process ANSI color codes in shell output."
    (let ((buf (ad-get-arg 0)))
      (and (bufferp buf)
           (string= (buffer-name buf) "*Shell Command Output*")
           (with-current-buffer buf
             (ansi-color-apply-on-region (point-min) (point-max))))))
  )

;; ;; <http://stackoverflow.com/questions/13397737/ansi-coloring-in-compilation-mode#20788581>.
;; (ignore-errors
;;   (require 'ansi-color)
;;   (defun my-colorize-compilation-buffer ()
;;     (when (eq major-mode 'compilation-mode)
;;       (ansi-color-apply-on-region compilation-filter-start (point-max))))
;;   (add-hook 'compilation-filter-hook 'my-colorize-compilation-buffer))

;;; init-ansi-color.el ends here
