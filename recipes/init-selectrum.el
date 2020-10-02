;;; init-selectrum.el --- This file is part of Danil <danil@kutkevich.org> home.

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

(custom-set-variables '(selectrum-count-style 'current/matches))

(custom-set-faces
 '(selectrum-current-candidate
   ((t :inverse-video t)))
 '(selectrum-primary-highlight
   ((t :background "red")))
 '(selectrum-secondary-highlight
   ((t :background "blue"))))

(add-hook 'after-init-hook 'noxrcp-selectrum)
(defun noxrcp-selectrum ()
  "My init."
  (selectrum-mode +1)
  (global-set-key (kbd "C-c C-r") #'selectrum-repeat)
  ;; (global-set-key (kbd "C-x C-r") 'noxrcp-selectrum--recentf)
  (global-set-key (kbd "M-y") 'noxrcp-selectrum--yank-pop))

;; Handle completion order for refs in magit with prescient
;; https://github.com/raxod502/selectrum/wiki/Additional-Configuration#handle-completion-order-for-refs-in-magit-with-prescient
(define-advice magit-list-refs (:around (orig &optional namespaces format sortby)
                                        prescient-sort)
  "Apply prescient sorting when listing refs."
  (let ((res (funcall orig namespaces format sortby)))
    (if (or sortby
            magit-list-refs-sortby
            (not selectrum-should-sort-p))
        res
      (prescient-sort res))))

;; ;; <https://github.com/raxod502/selectrum/wiki/Useful-Commands#switch-to-recent-file>
;; (defun noxrcp-selectrum--recentf ()
;;   "Use `completing-read' to open a recent file."
;;   (interactive)
;;   ;; (let ((files (mapcar 'abbreviate-file-name recentf-list)))
;;   ;;   (find-file (completing-read "Recentf: " files nil t)))
;;   (find-file (completing-read "Recentf: " recentf-list nil t)))

;; Yank kill ring
;; <https://github.com/raxod502/selectrum/wiki/Useful-Commands#my-yank-pop>,
;; <https://www.gnu.org/software/emacs/manual/html_node/eintr/yank.html>
(defun noxrcp-selectrum--yank-pop (&optional arg)
  "Paste a previously killed string.
With just \\[universal-argument] as ARG, put point at beginning,
and mark at end.  Otherwise, put point at the end, and mark at
the beginning without activating it.

This is like `yank-pop'.  The differences are:

- This let you manually choose a candidate to paste.

- This doesn't delete the text just pasted if the previous
  command is `yank'."
  (interactive "P")
  (let* ((selectrum-should-sort-p nil)
         (text nil))
    (setq text
          (completing-read "Yank: "
                           (cl-remove-duplicates
                            kill-ring :test #'equal :from-end t)
                           nil 'require-match))
    (unless (eq last-command 'yank)
      (push-mark))
    (setq last-command 'yank)
    (setq yank-window-start (window-start))
    (when (and delete-selection-mode (use-region-p))
      (delete-region (region-beginning) (region-end)))
    (insert-for-yank text)
    (if (consp arg)
        (goto-char (prog1 (mark t)
                     (set-marker (mark-marker) (point) (current-buffer)))))))

;; Markers (mark ring)
;; <https://github.com/raxod502/selectrum/wiki/Useful-Commands#markers-the-mark-ring>
(defcustom noxrcp-selectrum--mark-ring-highlight-face 'highlight
  "The face used to highlight the mark (shown as \"|\") in `selectrum-marks'."
  :type 'face
  :group 'selectrum)

(defvar noxrcp-selectrum--mark-ring-history ()
  "History for the command `selectrum-marks'.
This is probably not so useful, since marks can move with text.")

(defun noxrcp-selectrum--mark-ring ()
  "Jump to a marker in `mark-ring', signified by a highlighted \"|\" (the vertical bar character).
Currently truncates line if longer than window body width."
  (interactive)
  (if (null (marker-position (mark-marker)))
      ;; If the first marker is not placed (though it probably exists),
      ;; assume that no valid marks exist.
      (user-error "selectrum-marks: No marks currently exist.")
    (let* ((selectrum-should-sort-p nil)
           (formatted-candidates
            (save-excursion
              (cl-loop with window-width = (window-body-width (minibuffer-window))
                       for marker in (cons (mark-marker)
                                           ;; Some markers have the same position,
                                           ;; so we skip them.
                                           (cl-remove-duplicates
                                            mark-ring
                                            :test (lambda (m1 m2)
                                                    (= (marker-position m1)
                                                       (marker-position m2)))))
                       ;; Since we need to go to the marker's position anyway,
                       ;; we get and go to the position in one step.
                       ;; Since `mark-ring' is buffer local, we assume that
                       ;; all markers in it have a valid position.
                       for pos          = (goto-char (marker-position marker))
                       for line-beg-pos = (line-beginning-position)
                       ;; Get where we'll show the marker in the candidate.
                       ;; NOTE: At some point, we'll want to make sure this
                       ;; is actually visible for long lines.
                       for str-pos      = (- pos line-beg-pos)
                       ;; Get the marker's context.
                       for line-string  = (buffer-substring
                                           line-beg-pos (line-end-position))
                       ;; Display the marker in the candidate.
                       for highlighted-candidate = (concat (substring line-string 0 str-pos)
                                                           (propertize
                                                            "|"
                                                            'face noxrcp-selectrum--mark-ring-highlight-face)
                                                           (substring line-string str-pos))

                       ;; Create the final formatting of each candidate.
                       ;; Need to do formatting at end to make sure things are properly aligned.
                       collect pos                   into marker-positions
                       collect highlighted-candidate into highlighted-candidates

                       for      line-number =    (line-number-at-pos pos t)
                       collect  line-number into line-numbers
                       maximize line-number into max-line-number

                       collect  str-pos into column-numbers
                       maximize str-pos into max-col-number

                       finally return
                       (cl-loop with form = (concat "%0"   (number-to-string (length (number-to-string max-line-number)))
                                                    "d,%0" (number-to-string (length (number-to-string max-col-number)))
                                                    "d: %s")
                                for marker-pos in marker-positions
                                for line-num   in line-numbers
                                for col-num    in column-numbers
                                for cand       in highlighted-candidates
                                for str        =  (format form line-num col-num cand)
                                collect (cons (if (> (length str) window-width)
                                                  (concat (substring str 0 (- window-width 10)) "...")
                                                str)
                                              marker-pos)))))
           ;; Get the desired marker from the user.
           (chosen-cand (completing-read "Go to marker: " formatted-candidates nil
                                         t nil noxrcp-selectrum--mark-ring-history)))
      ;; Go to the chosen marker.
      (goto-char (cdr (assoc chosen-cand formatted-candidates))))))


;;; init-selectrum.el ends here
