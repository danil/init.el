;;; consult-ugrep.el --- Ugrep integration using Consult -*- lexical-binding: t; -*-

;; (eval-when-compile ;; as mentioned in consult-ag - required for byte-compile
;;   (require 'cl-lib)
;;   (require 'subr-x))
;; (require 'consult)

(defcustom consult-ugrep-config
  '(:args "ugrep --color=never --with-filename --line-number --column --smart-case --hidden --recursive"
    :regexp consult--grep-regexp-type
    :need-regexp t)
  "Configuration for ugrep backend."
  :type 'plist
  :group 'consult)

;;;###autoload
(defun consult-ugrep (&optional dir initial)
  "Search with ugrep in DIR with INITIAL input."
  (interactive "P")
  (let ((consult-grep-config consult-ugrep-config))
    (consult-grep dir initial)))

(provide 'consult-ugrep)

;;; consult-ugrep.el ends here
