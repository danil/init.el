(my-after-init
  (global-ethan-wspace-mode t)

  (my-eval-after-load 'ethan-wspace
    (setq ethan-wspace-face-customized t) ;<http://github.com/glasserc/ethan-wspace/blob/master/lisp/ethan-wspace.el#L714>
    ;; (setq  ethan-wspace-mode-line-element nil) ;typically looks like: ew:tLNm

    (cond ((equal frame-background-mode 'dark)
           (set-face-background 'ethan-wspace-face "gray15")))))
