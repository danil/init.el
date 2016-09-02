;;; init-dumb-jump.el --- This file is part of Danil <danil@kutkevich.org> home.

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

(add-hook 'after-init-hook 'myinit-dumb-jump)

(defun myinit-dumb-jump ()
  "My init."

  (myinit--after-load 'dumb-jump
    (define-key dumb-jump-mode-map (kbd "C-M-g") nil)
    (define-key dumb-jump-mode-map (kbd "C-M-p") nil)

    (define-key dumb-jump-mode-map (my-kbd "j d") 'my-dumb-jump))

  (dumb-jump-mode))

(defun my-dumb-jump ()
  (interactive)

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
