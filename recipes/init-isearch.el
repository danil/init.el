;;; init-isearch.el --- This file is part of Danil <danil@kutkevich.org> home.

;; Copyright (C) 2020 Danil <danil@kutkevich.org>.
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

(add-hook 'after-init-hook 'noxrcp-isearch)
(defun noxrcp-isearch ()
  "No X recipe init."
  ;; (ctrlf-mode +1)

  (global-set-key (kbd "C-s")   'noxrcp-isearch--forward-literal)          ;; isearch-forward                 or ctrlf-forward-literal  or swiper or swiper-multi
  (global-set-key (kbd "C-r")   'noxrcp-isearch--backward-literal)         ;; isearch-backward                or ctrlf-backward-literal or swiper or swiper-multi
  (global-set-key (kbd "C-M-s") 'noxrcp-isearch--forward-regexp)           ;; isearch-forward-regexp          or ctrlf-forward-regexp
  (global-set-key (kbd "C-M-r") 'noxrcp-isearch--backward-regexp)          ;; isearch-backward-regexp         or ctrlf-backward-regexp
  (global-set-key (kbd "M-s _") 'noxrcp-isearch--forward-symbol)           ;; isearch-forward-symbol          or ctrlf-forward-symbol
  (global-set-key (kbd "M-s .") 'noxrcp-isearch--forward-symbol-at-point)  ;; isearch-forward-symbol-at-point or ctrlf-forward-symbol-at-point
  )

(defun noxrcp-isearch--forward-literal ()
  (interactive)
  (noxrcp-isearch--literal 'isearch-forward 'ctrlf-forward-literal))

(defun noxrcp-isearch--backward-literal ()
  (interactive)
  (noxrcp-isearch--literal 'isearch-backward 'ctrlf-backward-literal))

(defun noxrcp-isearch--literal (isearch-fn ctrlf-fn)
  (interactive)
  (if current-prefix-arg
      (let ((n current-prefix-arg))
        (setq current-prefix-arg nil)
        (cond ((equal n 4)
               (swiper))
              ((equal n 5)
               (swiper-multi))
              (t
               (funcall ctrlf-fn))))
    (funcall isearch-fn)))

(defun noxrcp-isearch--forward-regexp ()
  (interactive)
  (if current-prefix-arg
      (progn (setq current-prefix-arg nil) (ctrlf-forward-regexp))
    (isearch-forward-regexp)))

(defun noxrcp-isearch--backward-regexp ()
  (interactive)
  (if current-prefix-arg
      (progn (setq current-prefix-arg nil) (ctrlf-backward-regexp))
    (isearch-backward-regexp)))

(defun noxrcp-isearch--forward-symbol ()
  (interactive)
  (if current-prefix-arg
      (progn (setq current-prefix-arg nil) (ctrlf-forward-symbol))
    (isearch-forward-symbol)))

(defun noxrcp-isearch--forward-symbol-at-point ()
  (interactive)
  (if current-prefix-arg
      (progn (setq current-prefix-arg nil) (ctrlf-forward-symbol-at-point))
    (isearch-forward-symbol-at-point)))

;; FIXME: use custom-set-faces
(add-hook 'isearch-mode-hook
          (lambda ()
            (cond ((equal frame-background-mode 'light)
                   (set-face-attribute 'isearch nil
                                       :foreground "lightskyblue1"
                                       :background "red1")
                   (set-face-attribute 'isearch-fail nil
                                       :foreground "lightskyblue1"
                                       :background "red1"))
                  ((equal frame-background-mode 'dark)
                   (set-face-attribute 'isearch nil
                                       :foreground "lightskyblue1"
                                       :background "red")
                   (set-face-attribute 'isearch-fail nil
                                       :foreground "lightskyblue1"
                                       :background "red")))))

;;; init-isearch.el ends here
