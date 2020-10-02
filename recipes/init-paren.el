;;; show-paren-mode <http://emacswiki.org/ShowParenMode>,
;;; <http://emacswiki.org/ParenthesesAppearance>.

(add-hook 'after-init-hook 'noxrcp-paren)

(defun noxrcp-paren ()
  "No X recipe init."

  ;; (noxrcp-after-load 'show-paren
  ;;   (cond ((equal frame-background-mode 'dark)
  ;;          (set-face-background 'show-paren-match "#002b36"))))
  (show-paren-mode t))
