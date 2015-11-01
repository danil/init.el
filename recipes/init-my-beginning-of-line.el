;;; Move point to beginning of line or "back to indentation"
;;; <http://stackoverflow.com/questions/6035872/moving-to-the-start-of-a-code-line-emacs#7250027>.

(my-init--hook
  ;; (global-set-key (my-kbd "n l b") 'my-beginning-of-line)
  (global-set-key (kbd "C-a") 'my-beginning-of-line))

(defun my-beginning-of-line (&optional arg)
  "Move point to the beginning of the line; if that is already the
current position of point, then move it to the beginning of text on
the current line."
  (interactive "P")

  (if arg
      (beginning-of-line-text)

    (let ((my-point (point)))
      (beginning-of-line)

      (when (eq my-point (point))
        (beginning-of-line-text)))))

;; (my-init--hook
;;   (eval-after-load "cc-mode"
;;     '(define-key c-mode-base-map (kbd "C-a") 'my-beginning-of-line)))
