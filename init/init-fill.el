(defgroup init-fill nil
  "init-fill"
  :group  'editing
  :tag    "init-fill"
  :prefix "init-fill-"
  :link   '(url-link :tag "GitHub" "https://github.com/danil/init.el"))

(defcustom init-fill-map-prefix "C-v " "init-fill" :group 'init-fill)

(defun init-fill ()
  (global-set-key (kbd (concat init-fill-map-prefix " r f")) 'fill-region))

(provide 'init-fill)
