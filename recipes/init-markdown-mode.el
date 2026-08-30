;;; -*- lexical-binding: t; -*-
(defcustom noxrcp-markdown-mode-patterns '()
  "Regexp patterns associated with `markdown-mode'."
  :group 'noxinit)

(custom-set-variables '(markdown-command "blackfriday-tool")
                      '(noxrcp-markdown-mode-patterns '(
                                                        "/Dropbox/deft/.*\\.txt\\'"
                                                        "/README\\'"
                                                        "/mutt[-a-zA-Z0-9]+\\'"
                                                        "\\.markdown\\'"
                                                        "\\.md\\'"
                                                        "\\.mdown\\'"
                                                        )))

(add-hook 'after-init-hook 'noxrcp-markdown-mode)

(defun noxrcp-markdown-mode ()
  "No X recipe init."

  (dolist (pattern noxrcp-markdown-mode-patterns)
    (add-to-list 'auto-mode-alist (cons pattern 'markdown-mode)))

  (if (boundp 'markdown-mode-map) (init-markdown-mode-xxxxxxxxxx)
    (with-eval-after-load 'markdown-mode (init-markdown-mode-xxxxxxxxxx))))

(defun init-markdown-mode-xxxxxxxxxx ()
  ;; (require 'eww) ;; used for eww-mode live preview

  (set-face-attribute 'markdown-italic-face nil :slant 'normal) ;some terminals have difficulties with italic/bold

  (define-key markdown-mode-map "\M-n" nil) ;unset markdown-next-wiki-link
  (define-key markdown-mode-map "\M-p" nil) ;unset markdown-previous-wiki-link
  (define-key markdown-mode-map (kbd "TAB") nil) 'markdown-cycle
  )

(fset 'markdown-header-style-convert
   (kmacro-lambda-form [?\C-a ?\C-s ?- ?- ?- ?\C-m ?\C-a ?\C-k ?\C-k ?\C-b ?\C-a ?# ?# ? ] 0 "%d"))
