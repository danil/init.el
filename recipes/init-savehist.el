;;; Session Management <http://www.emacswiki.org/emacs/SaveHist>,
;;; <http://emacswiki.org/SessionManagement>.
(add-hook 'after-init-hook 'init-savehist)

(defun init-savehist ()
  "Init."

  (savehist-mode t)

  (my-init--after-load 'savehist
    (setq savehist-additional-variables '(compile-command
                                          kill-ring
                                          regexp-search-ring
                                          search-ring))))
