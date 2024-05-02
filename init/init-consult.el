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

;; (defun init-consult-init ()
;; (message "cccccccccc")
;;   (require 'consult)
;;   (require 'consult-ugrep (file-name-concat user-emacs-directory "consult-ugrep.el")))

;; (defvar mu-consult-ugrep-args (string-join '("ugrep"
;;                                              "--color=never"
;;                                              "--exclude-dir=.git/"
;;                                              "--hidden"
;;                                              "--ignore-binary"
;;                                              "--ignore-case"
;;                                              "--line-buffered"
;;                                              "--line-number"
;;                                              "--null"
;;                                              "--recursive")
;;                                            " "))

;; (defun mu-consult-ugrep-make-builder (paths)
;;   "Create ugrep command line builder given PATHS."
;;   (let ((cmd (consult--build-args mu-consult-ugrep-args)))
;;     (lambda (input)
;;       (pcase-let* ((`(,arg . ,opts) (consult--command-split input))
;;                    (`(,re . ,hl)
;;                     (funcall consult--regexp-compiler arg 'extended t)))
;;         (when re
;;           (cons (append cmd
;;                         (cdr (mapcan (lambda (x) (list "--and" "-e" x)) re))
;;                         opts paths)
;;                 hl))))))

;; (defun mu-consult-ugrep (&optional dir initial)
;;   "Search with `ugrep' for files in DIR with INITIAL input."
;;   (interactive "P")
;;   (require 'consult)
;;   (consult--grep "Ugrep" #'mu-consult-ugrep-make-builder dir initial))

(provide 'init-consult)
