;;; This file is part of Danil Kutkevich <danil@kutkevich.org> home.

(defgroup init-lsp-mode nil
  "init-lsp-mode"
  :group  'editing
  :tag    "init-lsp-mode"
  :prefix "init-lsp-mode-"
  :link   '(url-link :tag "GitHub" "https://github.com/danil/init.el"))

(defun init-lsp-format-buffer ()
  (interactive)

  (if (or (not (boundp 'lsp-mode))
          (not lsp-mode))
      (call-interactively 'lsp)
    (call-interactively 'lsp-format-buffer)))

(provide 'init-lsp-mode)
