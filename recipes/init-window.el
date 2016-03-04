;;; init-window.el --- This file is part of Danil <danil@kutkevich.org> home.

;; Copyright (C) 2014-2015 Danil <danil@kutkevich.org>.
;; Author: Danil <danil@kutkevich.org>
;; Version: 0.0.1
;; Package-Requires: ((my-init))
;; Keywords: convenience
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

;; Split vertical by default
;; <http://stackoverflow.com/questions/20167246/emacs-open-buffer-in-vertical-split-by-default#20514750>.
(custom-set-variables '(split-height-threshold nil)
                      '(split-width-threshold 64))

(global-set-key (kbd "C-v") #'my-scroll)

(my-init--hook
  (global-set-key (my-kbd "b b") 'bury-buffer-with-repeat)
  (global-set-key (my-kbd "b r n") 'rename-buffer))

(defun bury-buffer-with-repeat ()
  "Bury current bufer and if repeat then bury next current buffer."

  (interactive)
  (my-with-repeat-while-press-last-key (bury-buffer)))

(defun my-scroll ()
  (interactive)

  (let* ((one-more-repeat t)
         (keynames '("h" "j" "k" "l" "u" "d")))

    (while one-more-repeat
      (message "Scroll up/down: j/k; half page: h/l; full page: u/d")

      (let* ((event (read-event))
             (keyname (format-kbd-macro (vector event) nil)))
        (clear-this-command-keys t)

        (if (member keyname keynames)
            (progn
              (cond ((equal keyname "j") (condition-case nil
                                             (scroll-up-line)
                                           (end-of-buffer)))

                    ((equal keyname "k") (condition-case nil
                                             (scroll-down-line)
                                           (beginning-of-buffer)))

                    ((equal keyname "h") (condition-case nil
                                             (my-scroll-up-half)
                                           (end-of-buffer)))

                    ((equal keyname "l") (condition-case nil
                                             (my-scroll-down-half)
                                           (beginning-of-buffer)))

                    ((equal keyname "u") (condition-case nil
                                             (scroll-down)
                                           (beginning-of-buffer)))

                    ((equal keyname "d") (condition-case nil
                                             (scroll-up)
                                           (end-of-buffer))))

              (setq last-input-event nil))

          (setq one-more-repeat nil)
          (push last-input-event unread-command-events))))))

(defun my-scroll-up-half ()
  "Scroll up half a page."
  (interactive)
  (scroll-up (my-window-half-height)))

(defun my-scroll-down-half ()
  "Scroll down half a page."
  (interactive)
  (scroll-down (my-window-half-height)))

(defun my-window-half-height ()
  "Get window half height obviously."
  (max 1 (/ (1- (window-height (selected-window))) 2)))

;;; init-window.el ends here
