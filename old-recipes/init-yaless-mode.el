;;; init-yaless-mode.el --- This file is part of Danil <danil@kutkevich.org> home.

;; Copyright (C) 2015 Danil <danil@kutkevich.org>.
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

;;; alternative: less-minor-mode <http://emacswiki.org/emacs/less.el>

(my-after-init
  (global-set-key (my-kbd "C-f") 'yaless-mode-on))

(defun yaless-mode-on ()
  (interactive)

  (when (and (buffer-file-name))
    ;; (buffer-modified-p)
    ;; (y-or-n-p (format "Save file %s? " (buffer-file-name)))
    (call-interactively 'save-buffer))

  (call-interactively 'yaless-mode))

(defun yaless-mode ()
  (interactive)

  (let* ((one-more-repeat t)
         (keynames '("j" "k" "f" "b" "n" "p" "u" "d" "0" "^" "$" "g" "G")))

    (while one-more-repeat
      (message "Scroll: j k u d; move: f b n p; line begin/end: 0 ^ $; buffer begin/end: g G")

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

                    ((equal keyname "u") (condition-case nil
                                             (scroll-down)
                                           (beginning-of-buffer)))

                    ((equal keyname "d") (condition-case nil
                                             (scroll-up)
                                           (end-of-buffer)))

                    ((equal keyname "f") (forward-char))
                    ((equal keyname "b") (backward-char))
                    ((equal keyname "n") (next-line))
                    ((equal keyname "p") (previous-line))

                    ((equal keyname "0") (beginning-of-line))
                    ((equal keyname "^") (beginning-of-line-text))
                    ((equal keyname "$") (call-interactively 'move-end-of-line))

                    ((equal keyname "g") (beginning-of-buffer))
                    ((equal keyname "G") (end-of-buffer)))

              (setq last-input-event nil))

          (setq one-more-repeat nil)
          (push last-input-event unread-command-events))))))

;;; init-yaless-mode.el ends here
