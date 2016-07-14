;;; init-rainbow-delimiters.el --- This file is part of Danil <danil@kutkevich.org> home.

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

(add-hook 'after-init-hook 'init-rainbow-delimiters)

(defun init-rainbow-delimiters ()
  "Init."

  (my-init--add-mode-to-hooks 'rainbow-delimiters-mode
                              my-init--programming-modes-hooks)

  ;; (my-init--add-mode-to-hooks (lambda ()
  ;;                               (when (or (not (boundp 'rainbow-delimiters-mode))
  ;;                                         (not (eq rainbow-delimiters-mode t)))
  ;;                                 (rainbow-delimiters-mode)))
  ;;                             my-init--programming-modes-hooks)

  (my-init--after-load 'rainbow-delimiters
    ;; <https://ericscrivner.me/2015/06/better-emacs-rainbow-delimiters-color-scheme/>.
    (custom-set-faces
     ;; custom-set-faces was added by Custom.
     ;; If you edit it by hand, you could mess it up, so be careful.
     ;; Your init file should contain only one such instance.
     ;; If there is more than one, they won't work right.
     '(rainbow-delimiters-depth-1-face ((t (:foreground "dark orange"))))
     '(rainbow-delimiters-depth-2-face ((t (:foreground "deep pink"))))
     '(rainbow-delimiters-depth-3-face ((t (:foreground "chartreuse"))))
     '(rainbow-delimiters-depth-4-face ((t (:foreground "deep sky blue"))))
     '(rainbow-delimiters-depth-5-face ((t (:foreground "yellow"))))
     '(rainbow-delimiters-depth-6-face ((t (:foreground "orchid"))))
     '(rainbow-delimiters-depth-7-face ((t (:foreground "spring green"))))
     '(rainbow-delimiters-depth-8-face ((t (:foreground "sienna1")))))))

;;; init-rainbow-delimiters.el ends here
