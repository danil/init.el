;;; init-recentf.el --- This file is part of Danil <danil@kutkevich.org> home.

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

;;; Recentf (open recent files)
;;; <http://stackoverflow.com/questions/3527150/open-recent-in-emacs#answer-3527488>,
;;; <http://emacswiki.org/RecentFiles>.

(custom-set-variables
 '(recentf-auto-cleanup 'never)
 '(recentf-max-menu-items 5000)
 '(recentf-max-saved-items nil) ;Maximum number of items of the recent list that will be saved. A nil value means to save the whole list.
 '(recentf-save-file "~/.emacs.var/recentf"))

(add-hook 'after-init-hook 'init-recentf)

(defun init-recentf ()
  "Init."

  (recentf-mode t))

;;; init-recentf.el ends here
