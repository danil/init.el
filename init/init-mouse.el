(defgroup init-mouse nil
  "init-mouse"
  :group  'editing
  :tag    "init-mouse"
  :prefix "init-mouse-"
  :link   '(url-link :tag "GitHub" "https://github.com/danil/init.el"))

(defun init-mouse ()
  (when (fboundp 'xterm-mouse-mode) (xterm-mouse-mode t)))

(provide 'init-mouse)
