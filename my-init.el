;;; my-init.el --- This file is part of Danil <danil@kutkevich.org> home.

;; Copyright (C) 2014-2015 Danil <danil@kutkevich.org>.
;; Author: Danil <danil@kutkevich.org>
;; Version: 0.0.1
;; Package-Requires: ()
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

;;;###autoload
(defcustom my-init--safe-modes-hooks '()
  "My hooks."
  :group 'my-init)

;;;###autoload
(defcustom my-init--programming-modes-hooks '()
  "My programming modes hooks."
  :group 'my-init)

;;;###autoload
(defcustom my-init--read-only-modes-hooks '()
  "My read only modes hooks."
  :group 'my-init)

;;;###autoload
(defcustom my-init--ruby-tools-hooks '()
  "My ruby tools hooks."
  :group 'my-init)

;;;###autoload
(defun my-kbd (key) (kbd (concat "C-c C-f " key)))

;; <http://blog.puercopop.com/post/56050999061/improving-emacss-startup-time>.
;;;###autoload
(defmacro my-after-init (&rest body)
  "After loading all the init files, evaluate BODY."
  (declare (indent defun))
  `(add-hook 'after-init-hook
             '(lambda () ,@body)))

;;;###autoload
(defmacro my-eval-after-load (feature &rest body)
  "After FEATURE is loaded, evaluate BODY."
  (declare (indent defun))
  `(eval-after-load ,feature
     '(progn ,@body)))

;; (defmacro my-eval-if-defined-or-after-load (symbol feature &rest body)
;;   "If function SYMBOL definded or variable SYMBOL defined or after
;;  FEATURE is loaded, evaluate BODY."
;;   (declare (indent defun))
;;   ;; (if (or (fboundp 'js-mode-map) (boundp 'js-mode-map))
;;   ;;     (define-key js-mode-map (kbd "C-c C-z") 'nodejs-repl)
;;   ;;   (with-eval-after-load 'js
;;   ;;     (define-key js-mode-map (kbd "C-c C-z") 'nodejs-repl)))
;; )

;;;###autoload
(defun my-add-auto-mode-to-patterns (mode &rest patterns)
  "Add entries to `auto-mode-alist' to use `MODE' for all given file `PATTERNS'."
  (dolist (pattern patterns)
    (add-to-list 'auto-mode-alist (cons pattern mode))))

;;;###autoload
(defun my-add-pattern-to-auto-modes (pattern &rest modes)
  "Add entries to `auto-mode-alist' to use `MODE' for all given file `PATTERNS'."
  (dolist (mode modes)
    (add-to-list 'auto-mode-alist (cons pattern mode))))

;;;###autoload
(defun my-add-mode-to-hooks (mode hooks)
  "Add `MODE' to all given `HOOKS'."
  (dolist (hook hooks) (add-hook hook mode)))

;;;###autoload
(defun my-autoload-file-on-functions (file-name &rest functions)
  "Autoload `FILE-NAME' if one of the given `FUNCTIONS' called."
  (dolist (function-name functions)
    (autoload function-name file-name nil t)))

(provide 'my-init)

;;; my-init.el ends here
