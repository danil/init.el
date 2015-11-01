;;; init-uniquify.el --- This file is part of Danil <danil@kutkevich.org> home.

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
  ;; Uniquify
  ;; <http://gnu.org/software/emacs/manual/html_node/emacs/Uniquify.html>,
  ;; <http://emacs-fu.blogspot.ru/2009/11/making-buffer-names-unique.html>.

  (require 'uniquify)

  (custom-set-variables '(uniquify-min-dir-content 20))

  (my-init--after-load 'uniquify
    ;; nil, forward, reverse, post-forward or post-forward-angle-brackets
    (setq
     uniquify-buffer-name-style 'post-forward ;'forward
     uniquify-separator "  " ;":"
     ;; uniquify-after-kill-buffer-p t ;rename after killing uniquified
     ;; uniquify-ignore-buffers-re "^\\*" ;don't muck with special buffers
     )))

;;; init-uniquify.el ends here
