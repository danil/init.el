;;; init-calendar.el --- This file is part of Danil <https://danil.kutkevich.org> home.

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

(custom-set-variables '(calendar-week-start-day 1))

(add-hook 'after-init-hook 'noxrcp-calendar)

(defun noxrcp-calendar ()
  "No X recipe init."

  (noxrcp-after-load 'calendar
    ;; Week numbers <http://www.emacswiki.org/emacs/CalendarWeekNumbers#toc1>.
    (copy-face font-lock-constant-face 'calendar-iso-week-face)

    (cond ((equal frame-background-mode 'dark)
           ;; (set-face-background 'calendar-today "red")
           (set-face-foreground 'calendar-iso-week-face "gray40")))

    (setq calendar-intermonth-text
          '(propertize
            (format "%2d"
                    (car
                     (calendar-iso-from-absolute
                      (calendar-absolute-from-gregorian (list month day year)))))
            'font-lock-face 'calendar-iso-week-face))))

;;; init-calendar.el ends here
