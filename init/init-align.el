;; <http://pragmaticemacs.com/emacs/aligning-text/>.
(defun init-align-whitespace (start end)
  "Align columns by whitespace in region between `START' and `END'."
  (interactive "r")
  (align-regexp start end "\\(\\s-*\\)\\s-" 1 0 t))

(provide 'init-align)
