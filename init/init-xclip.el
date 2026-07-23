(defgroup init-xclip nil
  "init-xclip"
  :group  'editing
  :tag    "init-xclip"
  :prefix "init-xclip-"
  :link   '(url-link :tag "GitHub" "https://github.com/danil/init.el"))

(defun init-xclip ()
  (if (boundp 'xclip-mode) (xclip-mode 1)
    (with-eval-after-load 'xclip (xclip-mode 1))))

(provide 'init-xclip)
