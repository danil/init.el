(defgroup init-faces nil
  "init-faces"
  :group  'editing
  :tag    "init-faces"
  :prefix "init-faces-"
  :link   '(url-link :tag "GitHub" "https://github.com/danil/init.el"))

(defface init-alert
  '((((background dark)) :foreground "green" :background "red" :weight bold)
    (((background light)) :foreground "green" :background "red" :weight bold))
  "Face for alert that need immediate attention."
  :group 'init-faces)

;; <http://stackoverflow.com/questions/1242352/get-font-face-under-cursor-in-emacs#1242366>.
(defun init-get-face-at-point (pos)
  (interactive "d")
  (let ((face (or (get-char-property (point) 'read-face-name)
                  (get-char-property (point) 'face))))
    (if face (message "Face: %s" face) (message "No face at %d" pos))))

(provide 'init-faces)
