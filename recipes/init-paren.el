;;; show-paren-mode <http://emacswiki.org/ShowParenMode>,
;;; <http://emacswiki.org/ParenthesesAppearance>.

(add-hook 'after-init-hook 'myinit-paren)

(defun myinit-paren ()
  "My init."

  ;; (myinit--after-load 'show-paren
  ;;   (cond ((equal frame-background-mode 'dark)
  ;;          (set-face-background 'show-paren-match "#002b36"))))
  (show-paren-mode t))
