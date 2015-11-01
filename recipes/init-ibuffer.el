;;; Ibuffer <http://emacswiki.org/IbufferMode>,
;;; <http://emacs-fu.blogspot.ru/20.0.12/dealing-with-many-buffers-ibuffer.html>,
;;; <http://martinowen.net/blog/20.0.12/tips-for-emacs-ibuffer.html>.

(autoload 'ibuffer "ibuffer" "List buffers." t)

(global-set-key (kbd "C-x C-b") 'ibuffer)

(my-init--hook
  (my-init--after-load 'ibuffer
    ;; (setq ibuffer-use-other-window 1)
    ;; <http://stackoverflow.com/questions/7598433/how-to-remove-a-key-from-a-minor-mode-keymap-in-emacs#7598754>.
    (define-key ibuffer-mode-map "\M-n" nil) ;unset ibuffer-forward-filter-group
    (define-key ibuffer-mode-map "\M-p" nil) ;unset ibuffer-backward-filter-group
    ))
