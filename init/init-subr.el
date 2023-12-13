;;; This file is part of Danil Kutkevich <danil@kutkevich.org> home.

(defgroup init-subr nil
  "init-subr"
  :group  'editing
  :tag    "init-subr"
  :prefix "init-subr-"
  :link   '(url-link :tag "GitHub" "https://github.com/danil/init.el"))

(defun init-subr () (when (boundp 'esc-map) (init-subr-init)))
(defun init-subr-init () (define-key esc-map "." nil))

(defun init-subr-insert-timestamp-unix ()
  (interactive)
  (insert (format-time-string "%s" nil "UTC0")))

(defun init-subr-insert-timestamp-datetime ()
  (interactive)
  (insert (format-time-string "%Y%m%dT%H%M%SZ" nil "UTC0")))

(defun init-subr-insert-timestamp-date ()
  (interactive)
  (insert (format-time-string "%Y%m%d" nil "UTC0")))

;; <https://emacs.stackexchange.com/questions/53175/when-does-shell-command-on-region-actually-pass-the-region-to-the-command#53176>.
(defun init-subr-shell-command-with-region-arg (command beginning end)
  "Prompt for a shell COMMAND, and use the region as an argument.

Buffer text from BEGINNING to END is passed as a single argument to COMMAND."
  (interactive (list (read-shell-command "Shell command: ")
                     (region-beginning)
                     (region-end)))
  (let ((region (buffer-substring-no-properties beginning end)))
    (shell-command (concat command " " (shell-quote-argument region)))))

(provide 'init-subr)
