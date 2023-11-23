;;; TODO: Move this recipe file to init!!!~~~~<danil@kutkevich.org>

(add-hook 'after-init-hook 'noxrcp-shell)
(defun noxrcp-shell ()
  "No X recipe init."
  (if (boundp 'shell-mode-map) (noxrcp-shell--setup)
    (with-eval-after-load 'shell (noxrcp-shell--setup))))

(defun noxrcp-shell--setup ()
  "No X recipe init."
  (define-key shell-mode-map (kbd "TAB") nil)
  (define-key shell-mode-map (noxel-kbd-fn "C-l") 'my-shell-clear))

(defun my-shell-clear (&optional arg)
  "Delete output from shell or kill output from shell if `ARG'.
Clear current shell beginning with a-la prompt to `point-min'.
Clearing by `delete-region' or by `kill-region' if `ARG'."
  (interactive "P")
  (goto-char (point-max))
  (search-backward "@")
  (beginning-of-line)
  (if arg
      (kill-region (point-min) (point))
    (delete-region (point-min) (point)))
  (delete-region (point-min) (point))
  (goto-char (point-max)))
