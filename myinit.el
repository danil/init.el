;;; myinit.el --- ???.

;; Copyright (C) 2016 Danil <danil@kutkevich.org>.
;; Author: Danil <danil@kutkevich.org>
;; Version: 0.0.1
;; Package-Requires: ((emacs "24.4"))
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

(require 'cl-lib)
(require 'quail)

(defgroup myinit nil
  "Easily introduce native modal editing of your own design"
  :group  'editing
  :tag    "Myinit"
  :prefix "myinit-"
  :link   '(url-link :tag "GitHub" "https://github.com/danil/init.el"))

;;;###autoload
(defcustom myinit-lighter " Myinit"
  "Lightner for `myinit-mode'.")

(defcustom myinit-cursor-type t
  "Cursor type to use in `myinit-mode'.

See description of `cursor-type' for mode information, this
variable should follow the same conventions."
  :tag "Cursor Type"
  :type '(choice
          (const :tag "use the cursor specified for the frame" t)
          (const :tag "don't display a cursor" nil)
          (const :tag "display a filled box cursor" box)
          (const :tag "display a hollow box cursor" hollow)
          (const :tag "display a vertical bar cursor with default width" bar)
          (cons  :tag "display a vertical bar cursor with given width"
                 (const bar) (integer :tag "width of cursor"))
          (const :tag "display a horizontal bar cursor with default height" hbar)
          (cons  :tag "display a horizontal bar cursor with given height"
                 (const hbar (integer :tag "height of cursor")))))

;;;###autoload
(defcustom myinit-excluded-modes nil
  "List of major modes for which `myinit-mode' should not be activated.

This variable is considered when Myinit is enabled globally via
`myinit-global-mode'."
  :tag  "Excluded Modes"
  :type '(repeat :tag "Major modes to exclude" symbol))

(defvar myinit-mode-map (make-sparse-keymap)
  "This is Myinit mode map, used to translate your keys.")

;;;###autoload
(defun myinit-define-key (actual-key target-key)
  "Register translation from ACTUAL-KEY to TARGET-KEY."
  (define-key
    myinit-mode-map
    actual-key
    `(lambda ()
       (interactive)
       (let ((binding (key-binding ,target-key)))
         (unless (or (memq binding '(nil undefined))
                     (keymapp binding))
           (call-interactively binding))))))

;;;###autoload
(defun myinit-define-kbd (actual-kbd target-kbd)
  "Register translation from ACTUAL-KBD to TARGET-KBD.

Arguments are accepted in in the format used for saving keyboard
macros (see `edmacro-mode')."
  (myinit-define-key (kbd actual-kbd) (kbd target-kbd)))

;;;###autoload
(defun myinit-remove-key (key)
  "Unregister translation from KEY."
  (define-key myinit-mode-map key nil))

;;;###autoload
(defun myinit-remove-kbd (kbd)
  "Unregister translation from KBD.

Arguments are accepted in in the format used for saving keyboard
macros (see `edmacro-mode')."
  (myinit-remove-key (kbd kbd)))

;;;###autoload
(define-minor-mode myinit-mode
  "Toggle `myinit-mode' minor mode.

With a prefix argument ARG, enable `myinit-mode' if ARG is
positive, and disable it otherwise.  If called from Lisp, enable
the mode if ARG is omitted or NIL, and toggle it if ARG is
`toggle'.

This minor mode setups translation of key bindings according to
configuration created previously with `myinit-define-key' and
`myinit-define-keys'."
  nil myinit-lighter myinit-mode-map
  (setq-local cursor-type
              (if myinit-mode
                  myinit-cursor-type
                (default-value 'cursor-type))))

(defun myinit--maybe-activate ()
  "Activate `myinit-mode' if current buffer is not blacklisted.

This is used by `myinit-global-mode'."
  (unless (member major-mode myinit-excluded-modes) (myinit-mode 1)))

;;;###autoload
(define-globalized-minor-mode myinit-global-mode
  myinit-mode
  myinit--maybe-activate)

(defun myinit--input-function-advice (fnc key)
  "Call FNC with KEY as argument only when `myinit-mode' is disabled.

Otherwise use `list'."
  (funcall (if myinit-mode #'list fnc) key))

(advice-add 'quail-input-method :around #'myinit--input-function-advice)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;###autoload
(defcustom my-init--safe-modes '()
  "My modes with many minor modes enabled."
  :group 'my-init)

;;;###autoload
(defcustom my-init--programming-modes '()
  "My programming modes."
  :group 'my-init)

;;;###autoload
(defcustom my-init--auto-completion-modes '()
  "My auto completion."
  :group 'my-init)

;;;###autoload
(defcustom my-init--read-only-modes '()
  "My read only modes."
  :group 'my-init)

;;;###autoload
(defcustom my-init--toggle-quotes-modes '()
  "My ruby tools modes."
  :group 'my-init)

(defcustom my-init--modal-modes '()
  "My modal modes."
  :group 'my-init)

;;;###autoload
(defcustom my-init--safe-modes-hooks '()
  "My hooks."
  :group 'my-init)

;;;###autoload
(defcustom my-init--programming-modes-hooks '()
  "My programming modes hooks."
  :group 'my-init)

;;;###autoload
(defcustom my-init--auto-completion-modes-hooks '()
  "My auto completion hooks."
  :group 'my-init)

;;;###autoload
(defcustom my-init--read-only-modes-hooks '()
  "My read only modes hooks."
  :group 'my-init)

;;;###autoload
(defcustom my-init--toggle-quotes-modes-hooks '()
  "My ruby tools modes hooks."
  :group 'my-init)

(defcustom my-init--modal-modes-hooks '()
  "My modal modes hooks."
  :group 'my-init)

;; <http://blog.puercopop.com/post/56050999061/improving-emacss-startup-time>.
;;;###autoload
(defmacro my-init--hook (&rest body)
  "After loading all the init files, evaluate BODY."

  (declare (indent defun))
  `(add-hook 'after-init-hook
             '(lambda () ,@body)))

;;;###autoload
(defmacro my-init--after-load (feature &rest body)
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
(defun my-init--add-mode-to-patterns (mode &rest patterns)
  "Add entries to `auto-mode-alist' to use `MODE' for all given file `PATTERNS'."

  (dolist (pattern patterns)
    (add-to-list 'auto-mode-alist (cons pattern mode))))

;;;###autoload
(defun my-init--add-pattern-to-modes (pattern &rest modes)
  "Add entries to `auto-mode-alist' to use `MODE' for all given file `PATTERNS'."

  (dolist (mode modes)
    (add-to-list 'auto-mode-alist (cons pattern mode))))

;;;###autoload
(defun my-init--add-mode-to-hooks (mode hooks)
  "Add `MODE' to all given `HOOKS'."
  (dolist (hook hooks) (add-hook hook mode)))

;;;###autoload
(defun my-init--autoload-file-on-functions (file-name &rest functions)
  "Autoload `FILE-NAME' if one of the given `FUNCTIONS' called."
  (dolist (function-name functions)
    (autoload function-name file-name nil t)))

;;;###autoload
(defun my-kbd (key)
  "My key bindings start with \\<<C-v>> follow by `KEY'."
  (kbd (concat "C-v " key)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'myinit)

;;; myinit.el ends here
