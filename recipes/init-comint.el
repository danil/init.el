;;; init-comint.el --- This file is part of Danil <danil@kutkevich.org> home.

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

;;; Comint mode (which shell mode and sql mode based on)
;;; <http://www.emacswiki.org/emacs/ComintMode#toc3>.

(custom-set-variables '(comint-input-ring-size 10000))

(add-hook 'after-init-hook 'init-comint)

(defun init-comint ()
  "Init."

  (add-hook 'comint-mode-hook 'turn-on-comint-history)
  (add-hook 'kill-buffer-hook 'comint-write-input-ring)
  (add-hook 'kill-emacs-hook 'comint-write-input-ring-all-buffers))

;;; Persistent inferior comint command history
;;; <https://oleksandrmanzyuk.wordpress.com/2011/10/23/a-persistent-command-history-in-emacs/>

(defun fn-on-all-buffers (fn)
  "Run `FN' function on each buffer."

  (mapc (lambda (buffer)
          (with-current-buffer buffer
            (funcall fn)))
        (buffer-list)))

(defun comint-write-input-ring-all-buffers ()
  "Run `comint-write-input-ring' function on each buffer."

  (fn-on-all-buffers 'comint-write-input-ring))

(defun comint-write-history-on-exit (process event)
  "Write `PROCESS' history to the file on `EVENT'.
Write comint `comint-input-ring' associated with `PROCESS'
to the file on `EVENT'."

  (comint-write-input-ring)
  (let ((buf (process-buffer process)))
    (when (buffer-live-p buf)
      (with-current-buffer buf
        (insert (format "\nProcess %s %s" process event))))))

(defun turn-on-comint-history ()
  "Assign hook on sentinel event."

  (let ((process (get-buffer-process (current-buffer))))
    (when process
      (setq comint-input-ring-file-name
            (format "~/.emacs.var/inferior-%s-history"
                    (process-name process)))
      (comint-read-input-ring)
      (set-process-sentinel process
                            #'comint-write-history-on-exit))))

;;; init-comint.el ends here
