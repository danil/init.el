;;; This file is part of Danil Kutkevich <danil@kutkevich.org> home.

(defgroup init-xref nil
  "init-xref"
  :group  'editing
  :tag    "init-xref"
  :prefix "init-xref-"
  :link   '(url-link :tag "GitHub" "https://github.com/danil/init.el"))

(defun init-xref ()
  (if (fboundp 'lsp) (init-xref-lsp)
    (with-eval-after-load 'lsp-mode (init-xref-lsp))))

(defun init-xref-lsp ()
  (defun init-xref-find-definitions ()
    (interactive)

    (if (or (not (boundp 'lsp-mode))
            (not lsp-mode))
        (call-interactively 'lsp)
      (call-interactively 'lsp-find-definition))))

(defalias 'init-xref-find-definitions 'xref-find-definitions)

(provide 'init-xref)
