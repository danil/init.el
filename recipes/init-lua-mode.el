(add-hook 'after-init-hook 'init-lua-mode)

(defun init-lua-mode ()
  "Init."

  (myinit--add-mode-to-patterns 'lua-mode "\\.ws\\'")

  (myinit--after-load 'lua-mode
    ;; <http://lua-users.org/wiki/LuaStyleGuide>,
    ;; <http://stackoverflow.com/questions/4643206/how-to-configure-indentation-in-emacs-lua-mode#answer-4652043>.
    (setq lua-indent-level 2)
    ;; (define-key lua-mode-map "\C-c\C-f" nil)
    (define-key lua-mode-map "\C-v" nil)))
