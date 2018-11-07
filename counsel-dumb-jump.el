;;; counsel-dumb-jump.el --- better ivy integration with dumb-jump.
;; Copyright (C) 2017 Jules Tamagnan
;; Author: Jules Tamagnan
;; Version: 0.1.0
;; Package-Requires: ((emacs "24.3") (dash "2.9.0") (ivy "0.9.1") (counsel "0.9.1") (dumb-jump "0.5.1"))
;; Keywords: programming

;; Counsel Dumb Jump is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 3, or (at
;; your option) any later version.
;;
;; Counsel Dumb Jump is distributed in the hope that it will be
;; useful, but WITHOUT ANY WARRANTY; without even the implied warranty
;; of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with Counsel Dumb Jump.  If not, see http://www.gnu.org/licenses.

;;; Commentary:

;; Counsel Dumb Jump is an Emacs package with to improve the Dumb Jump package's
;; compatibility with Ivy.
(require 'ivy)
(require 'counsel)
(require 'dash)
(require 'dumb-jump)

(defvar counsel-dumb-jump--current-proj "")

(defun counsel-dumb-jump--ivy-jump-to-selected-occur ()
  "Generate a custom occur buffer for `dumb-jump-prompt-user-for-choice'."
  (unless (eq major-mode 'ivy-occur-grep-mode)
    (ivy-occur-grep-mode))
  (setq default-directory counsel-dumb-jump--current-proj)
  ;; Need precise number of header lines for `wgrep' to work.
  (insert (format "-*- mode:grep; default-directory: %S -*-\n\n\n" default-directory))
  (insert (format "%d candidates:\n" (length ivy--all-candidates)))
  (ivy--occur-insert-lines
   (mapcar (lambda (cand) (concat prepend cand)) ivy--all-candidates)))

(defun counsel-dumb-jump-ivy-jump-to-selected (results choices proj)
  "Offer CHOICES as canidates through ivy-read then execute
dumb-jump-to-selected on RESULTS CHOICES and selected choice.
Assign PROJ to `counsel-dumb-jump--current-proj' for use in occur
buffer"
  (setq counsel-dumb-jump--current-proj proj)
  (ivy-read "Jump to: "  choices
      :action (-partial #'dumb-jump-to-selected results choices)
      :keymap counsel-ag-map
            :history 'counsel-git-grep-history
      :caller #'dumb-jump-go))

(ivy-set-occur #'dumb-jump-go #'counsel-dumb-jump--ivy-jump-to-selected-occur)
(ivy-set-display-transformer #'dumb-jump-go #'counsel-git-grep-transformer)

;;; counsel-dumb-jump.el ends here
