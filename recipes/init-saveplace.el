;;; <http://www.emacswiki.org/emacs/SavePlace>.
(my-init--hook
  (custom-set-variables '(save-place-limit 1000))
  (require 'saveplace)

  (my-init--after-load 'saveplace
    (setq-default save-place t)
    (setq save-place-file "~/.emacs.d/saved-places")))
