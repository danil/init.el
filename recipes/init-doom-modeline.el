;;; init-doom-modeline.el --- This file is part of Danil <danil@kutkevich.org> home.

;; Copyright (C) 2018 Danil <danil@kutkevich.org>.
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

(add-hook 'after-init-hook 'noxrcp-doom-modeline)
(defun noxrcp-doom-modeline ()
  "My init."
  (if (fboundp 'doom-modeline-def-segment) (noxrcp-doom-modeline--setup)
    (with-eval-after-load 'doom-modeline (noxrcp-doom-modeline--setup)))
  ;; (doom-modeline-set-modeline 'noxinit t)
  (doom-modeline-set-modeline 'main t))

(defun noxrcp-doom-modeline--setup ()
  "My init."
  (noxrcp-doom-modeline---setup)
  (doom-modeline-def-modeline
   'noxinit
   '(workspace-number noxinit-window-number noxinit-buffer-position "X" buffer-info "X")
   '(noxinit-window-number))
  (setq doom-modeline-buffer-file-name-style 'truncate-upto-project)
  (setq doom-modeline-icon nil))

(defun noxrcp-doom-modeline---setup ()
  "My init."
  (doom-modeline-def-segment
   noxinit-buffer-position
   "The buffer position information."
   mode-line-position
   ;; '(" " mode-line-position)
   )
  (doom-modeline-def-segment
   noxinit-window-number
   (let ((num (cond
               ((bound-and-true-p ace-window-display-mode)
                (setq mode-line-format
                      (assq-delete-all 'ace-window-display-mode
                                       (default-value 'mode-line-format)))
                (aw-update)
                (window-parameter (selected-window) 'ace-window-path))
               ((bound-and-true-p winum-mode)
                (setq winum-auto-setup-mode-line nil)
                (winum-get-number-string))
               ((bound-and-true-p window-numbering-mode)
                (window-numbering-get-number-string))
               (t ""))))
     (if (< 0 (length num))
         (propertize (format "%s" num)
                     'face (if (doom-modeline--active)
                               'doom-modeline-buffer-major-mode))
       ""))))

;;; init-doom-modeline.el ends here
