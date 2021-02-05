(defun init-elisp-slime-nav ()
  (if (fboundp 'elisp-slime-nav-find-elisp-thing-at-point) (noxrcp-elisp-slime-nav--setup)
    (with-eval-after-load 'elisp-slime-nav (noxrcp-elisp-slime-nav--setup))))

(defun noxrcp-elisp-slime-nav--setup ()
  (add-hook 'emacs-lisp-mode-hook 'elisp-slime-nav-mode)

  (define-key emacs-lisp-mode-map (kbd "C-c C-j") 'elisp-slime-nav-find-elisp-thing-at-point)
  (define-key emacs-lisp-mode-map (kbd "C-c C-k") 'xref-pop-marker-stack))

(provide 'init-elisp-slime-nav)
