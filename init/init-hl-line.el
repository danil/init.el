;;; This file is part of Danil Kutkevich <danil@kutkevich.org> home.

(defgroup init-hl-line nil
  "init-hl-line"
  :group  'editing
  :tag    "init-hl-line"
  :prefix "init-hl-line-"
  :link   '(url-link :tag "GitHub" "https://github.com/danil/init.el"))

(defun init-hl-line ()
  (if (boundp 'hl-line-face) (init-hl-line-init)
    (with-eval-after-load 'hl-line (init-hl-line-init))))

(defun init-hl-line-init ()
  (set-face-attribute hl-line-face nil :inherit nil :inverse-video t))

(defun init-hl-line-on ()
  (interactive)

  (let ((n current-prefix-arg)) ; FIXME: ????????????????????????????????????????????????????????????????????????????????
    (setq current-prefix-arg nil)

    (if (equal n '(4))
        (call-interactively 'exchange-point-and-mark)
      (call-interactively 'hl-line-mode))

    (setq current-prefix-arg n)))

(provide 'init-hl-line)
