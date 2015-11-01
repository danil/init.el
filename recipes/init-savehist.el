;;; Session Management <http://www.emacswiki.org/emacs/SaveHist>,
;;; <http://emacswiki.org/SessionManagement>.
(my-init--hook
  (savehist-mode t)

  (my-init--after-load 'savehist
    (setq savehist-additional-variables '(compile-command
                                          kill-ring
                                          regexp-search-ring
                                          search-ring))))
