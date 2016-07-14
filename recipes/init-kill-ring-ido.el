;;; init-kill-ring-ido.el --- This file is part of Danil <danil@kutkevich.org> home.

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

(autoload 'kill-ring-ido "kill-ring-ido" nil t)

(add-hook 'after-init-hook 'init-kill-ring-ido)

(defun init-kill-ring-ido ()
  "Init."

  ;; (global-set-key (kbd "M-y") 'my-yank-pop-with-ido)

  (my-init--after-load 'kill-ring-ido
    (setq kill-ring-ido-shortage-length 1000)))

(defun my-yank-pop-with-ido (&optional arg)
  (interactive "P")

  (if arg
      (call-interactively 'yank-pop)
    (call-interactively 'kill-ring-ido)))

;;; init-kill-ring-ido.el ends here
