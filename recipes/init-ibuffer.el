;;; init-ibuffer.el --- This file is part of Danil <danil@kutkevich.org> home.

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

;;; Ibuffer <http://emacswiki.org/IbufferMode>,
;;; <http://emacs-fu.blogspot.ru/20.0.12/dealing-with-many-buffers-ibuffer.html>,
;;; <http://martinowen.net/blog/20.0.12/tips-for-emacs-ibuffer.html>.

(autoload 'ibuffer "ibuffer" "List buffers." t)

(global-set-key (kbd "C-x C-b") 'ibuffer)

(add-hook 'after-init-hook 'init-ibuffer)

(defun init-ibuffer ()
  "Init."

  (myinit--after-load 'ibuffer
    ;; (setq ibuffer-use-other-window 1)
    ;; <http://stackoverflow.com/questions/7598433/how-to-remove-a-key-from-a-minor-mode-keymap-in-emacs#7598754>.
    (define-key ibuffer-mode-map "\M-g" nil) ;ibuffer-jump-to-buffer
    (define-key ibuffer-mode-map "\M-n" nil) ;unset ibuffer-forward-filter-group
    (define-key ibuffer-mode-map "\M-p" nil) ;unset ibuffer-backward-filter-group

    (add-hook 'ibuffer-hook 'my-get-rid-of-ibuffer-buffer)))

(defun my-get-rid-of-ibuffer-buffer ()
"Bury annoying *Ibuffer*."

  (let ((buffer (get-buffer "*Ibuffer*")))
    (when buffer (bury-buffer buffer))))

;;; init-ibuffer.el ends here
