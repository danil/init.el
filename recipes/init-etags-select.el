;;; init-etags-select.el --- This file is part of Danil <danil@kutkevich.org> home.

;; Copyright (C) 2016 Danil <danil@kutkevich.org>.
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

(global-set-key (kbd "M-.") 'etags-select-find-tag-at-point-or-region)

(my-init--hook
  (my-init--after-load 'etags-select
    (define-key etags-select-mode-map (kbd "C-g") 'etags-select-quit)
    (define-key etags-select-mode-map (kbd "C-n") 'etags-select-next-tag)
    (define-key etags-select-mode-map (kbd "C-p") 'etags-select-previous-tag)

    (define-key etags-select-mode-map (kbd "M-RET")
      'etags-select-goto-tag-other-window)

    (define-key etags-select-mode-map (kbd "RET") 'etags-select-goto-tag)))

(defun etags-select-find-tag-at-point-or-region ()
  "Finds tag at point or selected region using etags-select."
  (interactive)
  (require 'etags-select)
  (if (region-active-p)
      (etags-select-find
       (buffer-substring (region-beginning) (region-end)))
    (etags-select-find-tag-at-point)))

;;; init-etags-select.el ends here
