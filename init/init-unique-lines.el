;;; This file is part of Danil Kutkevich <danil@kutkevich.org> home.

;; Deduplicate lines <http://emacswiki.org/emacs/DuplicateLines>.
(defun init-unique-lines-region (start end)
  "Find duplicate lines in region START to END keeping first occurrence."
  (interactive "*r")
  (save-excursion
    (let ((end (copy-marker end)))
      (while
          (progn
            (goto-char start)
            (re-search-forward "^\\(.*\\)\n\\(\\(.*\n\\)*\\)\\1\n" end t))
        (replace-match "\\1\n\\2"))))
  (message "The region lines is unique."))

(defun init-unique-lines-buffer ()
  "Delete duplicate lines in buffer and keep first occurrence."
  (interactive "*")
  (init-unique-lines-region (point-min) (point-max))
  (message "The buffer lines is unique."))
