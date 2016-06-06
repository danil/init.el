;;; init-my-shell-command-on-current-file.el --- This file is part of Danil <danil@kutkevich.org> home.

;; Copyright (C) 2014-2015 Danil <danil@kutkevich.org>.
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

(global-set-key (kbd "M-!") 'my-shell-command)

(defun my-shell-command (&optional arg)
  "Run my custom `shell-command' or `shell-command' if ARG."

  (interactive "P")
  (if arg
      (call-interactively 'shell-command)
    (call-interactively 'my-shell-command-on-current-file)))

;; Equivalent to vim's `%`
;; <http://stackoverflow.com/questions/11264811/emacs-equivalent-to-vims#11266694>.
;; TODO: Set dedicated buffers for each command/file via `output-buffer`.
(defun my-shell-command-on-current-file (command &optional output-buffer error-buffer)
  "Run a shell COMMAND on file(s) using OUTPUT-BUFFER and ERROR-BUFFER.
Run a shell COMMAND on the current file or marked dired files.
In the shell command, the file(s) will be substituted wherever a '%' is."
  (interactive (list (read-from-minibuffer "Shell command: "
                                           nil nil nil 'shell-command-history)
                     current-prefix-arg
                     shell-command-default-error-buffer))

  (cond ((buffer-file-name)
         (setq command (my-expand-command-by-string
                        command
                        (buffer-file-name))))

        ((and (equal major-mode 'dired-mode)
              (save-excursion (dired-move-to-filename)))
         (let ((path-to-file (mapconcat 'identity (dired-get-marked-files) " ")))
           (setq command (my-expand-command-by-string
                          command
                          path-to-file)))))

  (shell-command command output-buffer error-buffer))

(defun my-expand-command-by-string (command path-to-file)
  "Replace `%` in COMMAND by PATH-TO-FILE."

  (replace-regexp-in-string
   "%%?"
   (lambda (s) (if (string= s "%%") "%" path-to-file))
   command nil t))

;;; init-my-shell-command-on-current-file.el ends here
