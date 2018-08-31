;;; init-mouse.el --- This file is part of Danil <danil@kutkevich.org> home.

;; Copyright (C) 2017 Danil <danil@kutkevich.org>.
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

;; (add-hook 'after-init-hook 'myinit-mouse)

;; (defun myinit-mouse ()
;;   "My init."

;;   (global-unset-key [C-down-mouse-1])
;;   (global-unset-key [C-down-mouse-3])
;;   (global-unset-key [M-down-mouse-1])
;;   (global-unset-key [M-drag-mouse-1])
;;   (global-unset-key [M-mouse-1])
;;   (global-unset-key [M-mouse-2])
;;   (global-unset-key [M-mouse-3])
;;   (global-unset-key [S-down-mouse-1])
;;   (global-unset-key [bottom-divider down-mouse-1])
;;   (global-unset-key [double-mouse-1])
;;   (global-unset-key [drag-mouse-1])
;;   (global-unset-key [header-line down-mouse-1])
;;   (global-unset-key [header-line mouse-1])
;;   (global-unset-key [mode-line C-mouse-2])
;;   (global-unset-key [mode-line down-mouse-1])
;;   (global-unset-key [mode-line drag-mouse-1])
;;   (global-unset-key [mode-line mouse-1])
;;   (global-unset-key [mode-line mouse-2])
;;   (global-unset-key [mode-line mouse-3])
;;   (global-unset-key [mouse-1])
;;   (global-unset-key [mouse-2])
;;   (global-unset-key [mouse-3])
;;   (global-unset-key [right-divider down-mouse-1])
;;   (global-unset-key [triple-mouse-1])
;;   (global-unset-key [vertical-line C-mouse-2])
;;   (global-unset-key [vertical-line down-mouse-1])
;;   (global-unset-key [vertical-line mouse-1])
;;   (global-unset-key [vertical-scroll-bar C-mouse-2])

;;   (define-key function-key-map [M-mouse-2] nil)
;;   (define-key function-key-map [left-fringe mouse-1] nil)
;;   (define-key function-key-map [left-fringe mouse-2] nil)
;;   (define-key function-key-map [left-fringe mouse-3] nil)
;;   (define-key function-key-map [mouse-2] nil)
;;   (define-key function-key-map [right-fringe mouse-1] nil)
;;   (define-key function-key-map [right-fringe mouse-2] nil)
;;   (define-key function-key-map [right-fringe mouse-3] nil)
;;   (define-key global-map [down-mouse-1] nil)
;;   (define-key key-translation-map [double-down-mouse-1] nil)
;;   (define-key key-translation-map [down-mouse-1] nil)

;;   (dolist (k '([mouse-1] [down-mouse-1] [drag-mouse-1] [double-mouse-1] [triple-mouse-1]
;;                [mouse-2] [down-mouse-2] [drag-mouse-2] [double-mouse-2] [triple-mouse-2]
;;                [mouse-3] [down-mouse-3] [drag-mouse-3] [double-mouse-3] [triple-mouse-3]
;;                [mouse-4] [down-mouse-4] [drag-mouse-4] [double-mouse-4] [triple-mouse-4]
;;                [mouse-5] [down-mouse-5] [drag-mouse-5] [double-mouse-5] [triple-mouse-5]))
;;     (global-unset-key k))


;;   (setq mode-line-coding-system-map nil
;;         mode-line-column-line-number-mode-map nil
;;         mode-line-input-method-map nil)

;;   )

;; (define-minor-mode disable-mouse-mode
;;   "A minor-mode that disables all mouse keybinds."
;;   :global t
;;   :lighter " 🐭"
;;   :keymap (make-sparse-keymap))

;; (dolist (type '(mouse down-mouse drag-mouse
;;                       double-mouse triple-mouse))
;;   (dolist (prefix '("" C- M- S- M-S- C-M- C-S- C-M-S-))
;;     ;; Yes, I actually HAD to go up to 7 here.
;;     (dotimes (n 7)
;;       (let ((k (format "%s%s-%s" prefix type n)))
;;         (define-key disable-mouse-mode-map
;;           (vector (intern k)) #'ignore)))))

;;; init-mouse.el ends here
