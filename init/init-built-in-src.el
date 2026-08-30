;;; -*- lexical-binding: t; -*-
;;; This file is part of Danil Kutkevich <danil@kutkevich.org> home.

(defgroup init-built-in-src nil
  "init-built-in-src"
  :group  'editing
  :tag    "init-built-in-src"
  :prefix "init-built-in-src-"
  :link   '(url-link :tag "GitHub" "https://github.com/danil/init.el"))

(defun init-kill-emacs ()
  (interactive)
  ;; First update the alist.
  ;; This loads the old save-place-file if nec.
  (save-places-to-alist)
  ;; Now save the alist in the file,
  ;; if we have ever loaded the file (including just now).
  (when save-place-loaded (save-place-alist-to-file))
  (kill-emacs))

(provide 'init-built-in-src)
