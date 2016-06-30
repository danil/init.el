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

(my-init--hook
  (global-set-key (kbd "<up>") #'scroll-down-line)
  (global-set-key (kbd "<down>") #'scroll-up-line)

  (global-set-key (kbd "<left>") #'scroll-down)
  (global-set-key (kbd "<right>") #'scroll-up)

  (define-key myinit-map (kbd "b b") 'bury-buffer-with-repeat)
  (define-key myinit-map (kbd "b r n") 'rename-buffer))

(defun bury-buffer-with-repeat ()
  "Bury current bufer and if repeat then bury next current buffer."

  (interactive)
  (my-with-repeat-while-press-last-key (bury-buffer)))

;;; init-window.el ends here
