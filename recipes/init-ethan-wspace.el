(my-init--hook
  (global-ethan-wspace-mode t)

  (my-init--after-load 'ethan-wspace
    (setq ethan-wspace-face-customized t) ;<http://github.com/glasserc/ethan-wspace/blob/master/lisp/ethan-wspace.el#L714>
    ;; (setq  ethan-wspace-mode-line-element nil) ;typically looks like: ew:tLNm

    (cond ((equal frame-background-mode 'dark)
           (set-face-background 'ethan-wspace-face "gray15")))))
