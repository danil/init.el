;;; -*- lexical-binding: t; -*-
(defgroup init-expand-region nil
  "init-expand-region"
  :group  'editing
  :tag    "init-expand-region"
  :prefix "init-expand-region-"
  :link   '(url-link :tag "GitHub" "https://github.com/danil/init.el"))

(defun init-expand-region ()
  (setq modes '(er/expand-region
                er/mark-comment
                er/mark-defun
                er/mark-email
                er/mark-inside-pairs
                er/mark-inside-quotes
                er/mark-method-call
                er/mark-next-accessor
                er/mark-outside-pairs
                er/mark-outside-quotes
                er/mark-symbol
                er/mark-symbol-with-prefix
                er/mark-url
                er/mark-word))

  (dolist (m modes) (autoload m "expand-region" nil t))
  )

(provide 'init-expand-region)
