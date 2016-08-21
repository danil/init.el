;;; init-linum-format.el --- This file is part of Danil <danil@kutkevich.org> home.

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

;;; Linum (line numbers) format.
;;; Separating line numbers from text
;;; <http://www.emacswiki.org/emacs/LineNumbers#toc7>.

(add-hook 'after-init-hook 'init-linum-format)

(defun init-linum-format ()
  "Init."

  (my-init--after-load 'linum
    (unless window-system
      (setq linum-format 'my-linum-format))

    (defgroup my-line-numbers nil
      "Custom line numbers in the left margin."
      :group 'linum
      :prefix "my-line-numbers-")
    (defface my-line-numbers-separator
      '((t :inherit linum))
      "Face for separation between the line number display and the buffer contents."
      :group 'my-line-numbers)
    (set-face-background 'my-line-numbers-separator
                         my-line-numbers-background)))

(unless window-system
  (add-hook 'linum-before-numbering-hook
            (lambda ()
              (setq-local linum-format-fmt
                          (let ((w (length
                                    (number-to-string
                                     (count-lines (point-min)
                                                  (point-max))))))
                            (concat "%" (number-to-string w) "d"))))))

(defun my-linum-format (line)
  (concat
   (propertize (format linum-format-fmt line) 'face 'linum)
   ;; (propertize " " 'face 'my-line-numbers-separator)
   ))

;;; init-linum-format.el ends here
