(autoload 'turn-on-pretty-lambda-mode "pretty-lambdada" nil t)

(my-init--add-mode-to-hooks 'turn-on-pretty-lambda-mode '(emacs-lisp-mode-hook
                                               lisp-mode-hook))
