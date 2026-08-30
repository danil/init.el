;;; -*- lexical-binding: t; -*-
;;; This file is part of Danil Kutkevich <danil@kutkevich.org> home.

(defun init-elisp-slime-nav ()
  (if (fboundp 'elisp-slime-nav-find-elisp-thing-at-point) (noxrcp-elisp-slime-nav-init)
    (with-eval-after-load 'elisp-slime-nav (noxrcp-elisp-slime-nav-init))))

(defun noxrcp-elisp-slime-nav-init ()
  (add-hook 'emacs-lisp-mode-hook 'elisp-slime-nav-mode)

  (define-key emacs-lisp-mode-map (kbd "C-c C-j") 'elisp-slime-nav-find-elisp-thing-at-point) ; FIXME: A hard coded hotkey string is a anti-pattern instead must use a best practice and do adding of the `init-???-bindings` customizable variable and using it.~~~~<danil@kutkevich.org>
  (define-key emacs-lisp-mode-map (kbd "C-c C-k") 'xref-pop-marker-stack)) ; FIXME: A hard coded hotkey string is a anti-pattern instead must use a best practice and do adding of the `init-???-bindings` customizable variable and using it.~~~~<danil@kutkevich.org>

(provide 'init-elisp-slime-nav)
