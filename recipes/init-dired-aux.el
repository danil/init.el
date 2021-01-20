;;; init-dired-aux.el --- This file is part of Danil <https://danil.kutkevich.org> home.

;; Copyright (C) 2021 Danil <https://danil.kutkevich.org>.
;; Author: Danil <https://danil.kutkevich.org>
;; Maintainer: Danil <https://danil.kutkevich.org>
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

(add-hook 'after-init-hook 'noxrcp-dired-aux)

(defun noxrcp-dired-aux ()
  "No X recipe init."

  (if (boundp 'dired-mode-map)
      (noxrcp-lazy-dired-aux)

    (with-eval-after-load 'dired
      (noxrcp-lazy-dired-aux))))

(defun noxrcp-lazy-dired-aux ()
  "My init lazy."

  (define-key dired-mode-map (kbd "C-c Q") 'noxrcp-dired-aux--dired-do-query-replace))

(defun noxrcp-dired-aux--dired-do-query-replace (from to &optional delimited)
  "Do `query-replace' of FROM with TO, on all marked files.
Third arg DELIMITED (prefix arg) means replace only word-delimited matches.
If you exit (\\[keyboard-quit], RET or q), you can resume the query replace
with the command \\[tags-loop-continue]."
  (interactive
   (let ((common
          (query-replace-read-args
           "Query replace in marked files" nil t)))
     (list (nth 0 common) (nth 1 common) (nth 2 common))))
  (require 'dired-aux)
  (dolist (file (dired-get-marked-files nil nil 'dired-nondirectory-p))
    (let ((buffer (get-file-buffer file)))
      (if (and buffer (with-current-buffer buffer
                        buffer-read-only))
          (error "File `%s' is visited read-only" file))))
  (noxrcp-dired-aux--tags-query-replace
   from to delimited '(dired-get-marked-files nil nil 'dired-nondirectory-p)))

(defun noxrcp-dired-aux--tags-query-replace (from to &optional delimited file-list-form)
  "Do `query-replace' of FROM with TO on all files listed in tags table.
Third arg DELIMITED (prefix arg) means replace only word-delimited matches.
If you exit (\\[keyboard-quit], RET or q), you can resume the query replace
with the command \\[tags-loop-continue].
Fourth arg FILE-LIST-FORM non-nil means initialize the replacement loop.
Fifth and sixth arguments START and END are accepted, for compatibility
with `query-replace', and ignored.

If FILE-LIST-FORM is non-nil, it is a form to evaluate to
produce the list of files to search.

See also the documentation of the variable `tags-file-name'."
  (interactive (query-replace-read-args "Tags query replace" nil t))
  (require 'etags)
  (setq tags-loop-scan `(let ,(unless (equal from (downcase from))
                                '((case-fold-search nil)))
                          (if (search-forward ',from nil t)
                              ;; When we find a match, move back
                              ;; to the beginning of it so perform-replace
                              ;; will see it.
                              (goto-char (match-beginning 0))))
        tags-loop-operate `(perform-replace ',from ',to t nil ',delimited
                                            nil multi-query-replace-map))
  (tags-loop-continue (or file-list-form t)))

;;; init-dired-aux.el ends here
