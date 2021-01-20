;;; init-transpose-frame.el --- This file is part of Danil <https://danil.kutkevich.org> home.

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

(add-hook 'after-init-hook 'noxrcp-transpose-frame)

(defun noxrcp-transpose-frame ()
  "No X recipe init."

  (define-key noxrcp-map (kbd "T") 'my-transpose-frame))

(defun my-transpose-frame ()
  (interactive)

  (let* ((one-more-repeat t)
         (keynames '("SPC" "j" "k" "RET" "h" "l")))

    (while one-more-repeat
      (message "transpose: SPC; flip/flop: j k, rotate 180°: RET, 90°: h, -90°: l")

      (let* ((event (read-event))
             (keyname (format-kbd-macro (vector event) nil)))
        (clear-this-command-keys t)

        (if (member keyname keynames)
            (progn

              (cond ((equal keyname "SPC") (transpose-frame)) ;Transpose windows arrangement at FRAME. Omitting FRAME means currently selected frame.
                    ((equal keyname "j") (flip-frame)) ;Flip windows arrangement vertically at FRAME. Omitting FRAME means currently selected frame.
                    ((equal keyname "k") (flop-frame)) ;Flop windows arrangement horizontally at FRAME. Omitting FRAME means currently selected frame.
                    ((equal keyname "RET") (rotate-frame)) ;Rotate windows arrangement 180 degrees at FRAME. Omitting FRAME means currently selected frame.
                    ((equal keyname "h") (rotate-frame-clockwise)) ;Rotate windows arrangement 90 degrees clockwise at FRAME. Omitting FRAME means currently selected frame.
                    ((equal keyname "l") (rotate-frame-anticlockwise)) ;Rotate windows arrangement 90 degrees anti-clockwise at FRAME. Omitting FRAME means currently selected frame.
                    )

              (setq last-input-event nil))

          (setq one-more-repeat nil)
          (push last-input-event unread-command-events))))))

;;; init-transpose-frame.el ends here
