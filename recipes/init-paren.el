;;; show-paren-mode <http://emacswiki.org/ShowParenMode>,
;;; <http://emacswiki.org/ParenthesesAppearance>.

(add-hook 'after-init-hook 'noxrcp-paren)

(defun noxrcp-paren ()
  "No X recipe init."

  (show-paren-mode t))
