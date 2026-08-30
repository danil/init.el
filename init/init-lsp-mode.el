;;; -*- lexical-binding: t; -*-
;;; This file is part of Danil Kutkevich <danil@kutkevich.org> home.

(defgroup init-lsp-mode nil
  "init-lsp-mode"
  :group  'editing
  :tag    "init-lsp-mode"
  :prefix "init-lsp-mode-"
  :link   '(url-link :tag "GitHub" "https://github.com/danil/init.el"))

(defcustom init-lsp-mode-modes '()
  "Major models that use LSP Language Server Protocol."
  :group 'init-lsp-mode)

(defun init-lsp-mode ()
  (if (boundp 'lsp-mode-map) (init-lsp-mode-init)
    (with-eval-after-load 'lsp-mode (init-lsp-mode-init)))

  (if (fboundp 'lsp) (init-lsp-mode-defun-find-definition)
    (with-eval-after-load 'lsp-mode (init-lsp-mode-defun-find-definition)))

  (defun init-lsp-mode-init-c-mode ()
    (define-key c-mode-map (kbd "C-c C-f") nil) ; FIXME: !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    (define-key c-mode-map (kbd "C-c C-f i") 'init-lsp-find-implementation) ; FIXME: ????????????????????????????????????????????????????????????????????????????????
    (define-key c-mode-map (kbd "C-c C-j") 'init-lsp-find-definition) ; xref-find-definitions ; lsp-find-definition
    (define-key c-mode-map (kbd "M-.") 'init-lsp-find-definition) ; xref-find-definitions ; lsp-find-definition ; godef-jump
    (define-key c-mode-map (kbd "C-c C-k") 'xref-pop-marker-stack))
  (if (boundp 'c-mode-map) (init-lsp-mode-init-c-mode)
    (with-eval-after-load 'c-mode (init-lsp-mode-init-c-mode)))

  (defun init-lsp-mode-init-c++-mode ()
    (define-key c++-mode-map (kbd "C-c C-f") nil) ; FIXME: !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    (define-key c++-mode-map (kbd "C-c C-f i") 'init-lsp-find-implementation) ; FIXME: ????????????????????????????????????????????????????????????????????????????????
    (define-key c++-mode-map (kbd "C-c C-j") 'init-lsp-find-definition) ; xref-find-definitions ; lsp-find-definition
    (define-key c++-mode-map (kbd "M-.") 'init-lsp-find-definition) ; xref-find-definitions ; lsp-find-definition ; godef-jump
    (define-key c++-mode-map (kbd "C-c C-k") 'xref-pop-marker-stack))
  (if (boundp 'c++-mode-map) (init-lsp-mode-init-c++-mode)
    (with-eval-after-load 'c++-mode (init-lsp-mode-init-c++-mode)))

  (defun init-lsp-mode-init-go-mode ()
    (define-key go-mode-map (kbd "C-c C-f i") 'init-lsp-find-implementation) ; FIXME: ????????????????????????????????????????????????????????????????????????????????
    (define-key go-mode-map (kbd "C-c C-j") 'init-lsp-find-definition) ; xref-find-definitions ; lsp-find-definition
    (define-key go-mode-map (kbd "M-.") 'init-lsp-find-definition) ; xref-find-definitions ; lsp-find-definition ; godef-jump
    (define-key go-mode-map (kbd "C-c C-k") 'xref-pop-marker-stack))
  (if (boundp 'go-mode-map) (init-lsp-mode-init-go-mode)
    (with-eval-after-load 'go-mode (init-lsp-mode-init-go-mode)))

  (defun init-lsp-mode-init-json-mode ()
    (define-key json-mode-map (kbd "C-c C-f") nil) ; FIXME: !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    (define-key json-mode-map (kbd "C-c C-f i") 'init-lsp-find-implementation) ; FIXME: ????????????????????????????????????????????????????????????????????????????????
    (define-key json-mode-map (kbd "C-c C-j") 'init-lsp-find-definition) ; xref-find-definitions ; lsp-find-definition
    (define-key json-mode-map (kbd "M-.") 'init-lsp-find-definition) ; xref-find-definitions ; lsp-find-definition ; godef-jump
    (define-key json-mode-map (kbd "C-c C-k") 'xref-pop-marker-stack))
  (if (boundp 'json-mode-map) (init-lsp-mode-init-json-mode)
    (with-eval-after-load 'json-mode (init-lsp-mode-init-json-mode)))

  (defun init-lsp-mode-init-markdown-mode ()
    (define-key markdown-mode-map (kbd "C-c C-f") nil) ; FIXME: !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    (define-key markdown-mode-map (kbd "C-c C-f i") 'init-lsp-find-implementation) ; FIXME: ????????????????????????????????????????????????????????????????????????????????
    (define-key markdown-mode-map (kbd "C-c C-j") 'init-lsp-find-definition) ; xref-find-definitions ; lsp-find-definition
    (define-key markdown-mode-map (kbd "M-.") 'init-lsp-find-definition) ; xref-find-definitions ; lsp-find-definition ; godef-jump
    (define-key markdown-mode-map (kbd "C-c C-k") 'xref-pop-marker-stack))
  (if (boundp 'markdown-mode-map) (init-lsp-mode-init-markdown-mode)
    (with-eval-after-load 'markdown-mode (init-lsp-mode-init-markdown-mode)))

  (defun init-lsp-mode-init-md-ts-mode ()
    (define-key md-ts-mode-map (kbd "C-c C-f") nil) ; FIXME: !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    (define-key md-ts-mode-map (kbd "C-c C-f i") 'init-lsp-find-implementation) ; FIXME: ????????????????????????????????????????????????????????????????????????????????
    (define-key md-ts-mode-map (kbd "C-c C-j") 'init-lsp-find-definition) ; xref-find-definitions ; lsp-find-definition
    (define-key md-ts-mode-map (kbd "M-.") 'init-lsp-find-definition) ; xref-find-definitions ; lsp-find-definition ; godef-jump
    (define-key md-ts-mode-map (kbd "C-c C-k") 'xref-pop-marker-stack))
  (if (boundp 'md-ts-mode-map) (init-lsp-mode-init-md-ts-mode)
    (with-eval-after-load 'md-ts-mode (init-lsp-mode-init-md-ts-mode)))

  (defun init-lsp-mode-init-sh-mode ()
    (define-key sh-mode-map (kbd "C-c C-f") nil) ; FIXME: !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    (define-key sh-mode-map (kbd "C-c C-f i") 'init-lsp-find-implementation) ; FIXME: ????????????????????????????????????????????????????????????????????????????????
    (define-key sh-mode-map (kbd "C-c C-j") 'init-lsp-find-definition) ; xref-find-definitions ; lsp-find-definition
    (define-key sh-mode-map (kbd "M-.") 'init-lsp-find-definition) ; xref-find-definitions ; lsp-find-definition ; godef-jump
    (define-key sh-mode-map (kbd "C-c C-k") 'xref-pop-marker-stack))
  (if (boundp 'sh-mode-map) (init-lsp-mode-init-sh-mode)
    (with-eval-after-load 'sh-script (init-lsp-mode-init-sh-mode)))

  (defun init-lsp-mode-init-zig-mode ()
    (define-key zig-mode-map (kbd "C-c C-f") nil) ; FIXME: !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    (define-key zig-mode-map (kbd "C-c C-f i") 'init-lsp-find-implementation) ; FIXME: ????????????????????????????????????????????????????????????????????????????????
    (define-key zig-mode-map (kbd "C-c C-j") 'init-lsp-find-definition) ; xref-find-definitions ; lsp-find-definition
    (define-key zig-mode-map (kbd "M-.") 'init-lsp-find-definition) ; xref-find-definitions ; lsp-find-definition ; godef-jump
    (define-key zig-mode-map (kbd "C-c C-k") 'xref-pop-marker-stack))
  (if (boundp 'zig-mode-map) (init-lsp-mode-init-zig-mode)
    (with-eval-after-load 'zig-mode (init-lsp-mode-init-zig-mode))))

(defun init-lsp-mode-init ()
  ;; (setq lsp-workspace-folders-remove (list (expand-file-name "~")))
  (add-to-list 'lsp-file-watch-ignored-directories (expand-file-name "~")))

(defun init-lsp-mode-defun-find-definition ()
  (defun init-lsp-find-definition ()
    (interactive)

    (if (init-lsp-mode-is-ready)
        (progn (init-lsp-mode-start-server)
               (call-interactively 'lsp-find-definition))
      (xref-find-definitions))))

(defalias 'init-lsp-find-definition 'xref-find-definitions)

(defun init-lsp-find-implementation ()
  (interactive)

  (if (init-lsp-mode-is-ready)
      (progn (init-lsp-mode-start-server)
             (call-interactively 'lsp-find-implementation))
    (message "lsp-mode is not ready to start LSP server.")))

(defun init-lsp-format-buffer-or-evil-indent ()
  (interactive)

  (if (init-lsp-mode-is-ready)
      (progn (init-lsp-mode-start-server)
             (call-interactively 'lsp-organize-imports)
             (call-interactively 'lsp-format-buffer))
    (call-interactively 'evil-indent)))

(defun init-lsp-format-buffer-or-indent-for-tab-command ()
  (interactive)

  (if (init-lsp-mode-is-ready)
      (progn (init-lsp-mode-start-server)
             (call-interactively 'lsp-organize-imports)
             (call-interactively 'lsp-format-buffer))
    (call-interactively 'indent-for-tab-command)))

(defun init-lsp-mode-is-ready ()
  (member major-mode init-lsp-mode-modes))

(defun init-lsp-mode-start-server ()
  (when (not (and (boundp 'lsp-mode) lsp-mode))
    (call-interactively 'lsp)))

(provide 'init-lsp-mode)
