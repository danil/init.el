;;; init-interprogram.el --- This file is part of Danil <danil@kutkevich.org> home.

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

(add-hook 'after-init-hook 'noxrcp-interprogram)

(defun noxrcp-interprogram ()
  "No X recipe init."

  ;; If emacs is run in a terminal, the clipboard- functions have no
  ;; effect. Instead, we use of xsel, see
  ;; http://www.vergenet.net/~conrad/software/xsel/ -- "a command-line
  ;; program for getting and setting the contents of the X selection"
  (unless window-system
    (when (getenv "DISPLAY")
      ;; Callback for when user cuts.
      (defun xsel-cut-function (text &optional push)
        ;; Insert text to temp-buffer, and "send" content to xsel stdin.
        (with-temp-buffer
          (insert text)
          ;; I prefer using the "clipboard" selection (the one the
          ;; typically is used by c-c/c-v) before the primary selection
          ;; (that uses mouse-select/middle-button-click)
          (call-process-region (point-min) (point-max)
                               "xsel" nil 0 nil "--clipboard" "--input")))
      ;; Call back for when user pastes
      (defun xsel-paste-function()
        ;; Find out what is current selection by xsel. If it is different
        ;; from the top of the kill-ring (car kill-ring), then return
        ;; it. Else, nil is returned, so whatever is in the top of the
        ;; kill-ring will be used.
        (let ((xsel-output (shell-command-to-string
                            ;; "2> /dev/null" is a workaround
                            ;; for the "\ No newline at end of selection" error
                            ;; <https://unix.stackexchange.com/questions/337171/to-which-stream-does-xsel-print-the-no-newline-warning#337335>.
                            "xsel --clipboard --output 2> /dev/null")))
          (unless (string= (car kill-ring) xsel-output)
            xsel-output )))
      ;; Attach callbacks to hooks.
      (setq interprogram-cut-function 'xsel-cut-function)
      (setq interprogram-paste-function 'xsel-paste-function)
      ;; Idea from
      ;; http://shreevatsa.wordpress.com/2006/10/22/emacs-copypaste-and-x/
      ;; http://www.mail-archive.com/help-gnu-emacs@gnu.org/msg03577.html
      )))

;;; init-selectrumy.el ends here
