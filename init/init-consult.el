;;; This file is part of Danil Kutkevich <danil@kutkevich.org> home.

(defgroup init-consult nil
  "init-consult"
  :group  'editing
  :tag    "init-consult"
  :prefix "init-consult-"
  :link   '(url-link :tag "GitHub" "https://github.com/danil/init.el"))

(defun init-consult ()
  ;; (if (boundp 'consult-narrow-map) (init-consult-init)
  ;;   (with-eval-after-load 'consult (init-consult-init)))
  )

(let ((f (file-name-concat user-emacs-directory "consult-ugrep.el")))
  (if (file-readable-p f)
      (require 'consult-ugrep f)
    (display-warning :consult-ugrep-occur-setup (format "Consult Ugrep setup not found: %s" f))))

(provide 'init-consult)
