;;; This file is part of Danil Kutkevich <danil@kutkevich.org> home.

(defgroup init-window nil
  "init-window"
  :group  'editing
  :tag    "init-window"
  :prefix "init-window-"
  :link   '(url-link :tag "GitHub" "https://github.com/danil/init.el"))

(defun init-window-scroll-right () (interactive) (scroll-right 1))
(defun init-window-scroll-left () (interactive) (scroll-left 1))

(defun init-window-delete-other-windows ()
  "Make WINDOW fill its frame (`delete-other-windows').

If `current-prefix-arg' is the default argument then
run `maximize-window' function."
  (interactive)

  (if (equal current-prefix-arg '(4)) ;universal-argument <http://www.gnu.org/software/emacs/manual/html_node/elisp/Prefix-Command-Arguments.html>, <http://www.gnu.org/software/emacs/manual/html_node/emacs/Arguments.html>
      (call-interactively 'maximize-window)
    (call-interactively 'delete-other-windows)))

(defun init-window-bury-buffer-maybe-delete-window (&optional arg)
  "Bury current buffer.
Delete selected window if `ARG' and other windows present."
  (interactive "P")

  (bury-buffer)
  (when (and arg
             (> (length (window-list)) 1))
    (delete-window (selected-window))))

(defun init-window-maybe-delete-window-maybe-kill-buffer-open-dired (&optional arg)
  "If `ARG' then `kill-buffer' or maybe kill buffer and open `dired'."
  (interactive "P")

  (if (not arg)
      (call-interactively 'kill-buffer)

    (let* ((f buffer-file-name)
           (d (if f (file-name-directory f) default-directory)))

      (init-window-maybe-delete-window-maybe-kill-buffer arg)
      (dired d)
      (when f (dired-goto-file f)))))

;; <http://stackoverflow.com/questions/18325973/a-smarter-alternative-to-delete-window#18754481>.
(defun init-window-maybe-delete-window-maybe-kill-buffer (&optional arg)
  "Delete selected window unless `ARG'.
If no other window shows it buffer, kill the buffer too."
  (interactive "P")

  (let* ((w (selected-window))
         (b (window-buffer w)))

    (when (and (not arg)
               (> (length (window-list)) 1))

      (delete-window w))

    (when (or arg
              (= (length (window-list)) 1)
              (not (get-buffer-window b 'visible)))

      (kill-buffer b))))

(provide 'init-window)
