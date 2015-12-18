;;; init-shell.el --- This file is part of Danil <danil@kutkevich.org> home.

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

(my-init--hook
  (global-set-key (my-kbd "t t") 'shell)

  (my-init--after-load 'shell
    (define-key shell-mode-map (kbd "C-c C-f") nil)
    (define-key shell-mode-map (my-kbd "C-l") 'my-shell-clear)))

(defun my-shell-clear (&optional arg)
  "Delete output from shell or kill output from shell if `ARG'.
Clear current shell beginning with a-la prompt to `point-min'.
Clearing by `delete-region' or by `kill-region' if `ARG'."

  (interactive "P")
  (goto-char (point-max))
  (search-backward "@")
  (beginning-of-line)

  (if arg
      (kill-region (point-min) (point))
    (delete-region (point-min) (point)))

  (delete-region (point-min) (point))

  (goto-char (point-max)))

;;; init-shell.el ends here
