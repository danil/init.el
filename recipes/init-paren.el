;;; show-paren-mode <http://emacswiki.org/ShowParenMode>,
;;; <http://emacswiki.org/ParenthesesAppearance>.

(my-init--hook
  ;; (my-init--after-load 'show-paren
  ;;   (cond ((equal frame-background-mode 'dark)
  ;;          (set-face-background 'show-paren-match "#002b36"))))
  (show-paren-mode t))
