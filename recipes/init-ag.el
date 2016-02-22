;;; init-ag.el --- This file is part of Danil <danil@kutkevich.org> home.

;; Copyright (C) 2015 Danil <danil@kutkevich.org>.
;; Author: Danil <danil@kutkevich.org>
;; Version: 0.0.1
;; Package-Requires: ((my-init) (ag))
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
  (global-set-key (my-kbd "f a k") 'my-ag-kill-buffers)
  (global-set-key (my-kbd "f a p r") 'ag-dired-regexp)
  (global-set-key (my-kbd "f a p s") 'ag-dired)
  (global-set-key (my-kbd "f a s r") 'ag-regexp)
  (global-set-key (my-kbd "f a s s") 'ag)

  (my-init--after-load 'ag
    ;; (cond ((equal frame-background-mode 'dark)
    ;;        ;; (set-face-background 'ag-match-face "green3")
    ;;        (set-face-foreground 'ag-match-face "lightskyblue1")))
    (setq ag-reuse-window 't)
    (set 'ag-highlight-search t)))

(defun my-ag-kill-buffers (&optional arg)
  (interactive "P")

  (if arg
      (progn (ag-kill-buffers) (message "All ag-mode buffers killed"))
    (ag-kill-other-buffers)
    (message "All ag-mode buffers other than the current buffer killed")))

;;; init-ag.el ends here
