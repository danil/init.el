;;; <http://www.emacswiki.org/emacs/SavePlace>.
(my-after-init
  (custom-set-variables '(save-place-limit 1000))
  (require 'saveplace)

  (my-eval-after-load 'saveplace
    (setq-default save-place t)
    (setq save-place-file "~/.emacs.d/saved-places")))