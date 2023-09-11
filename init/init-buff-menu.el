(defun init-buff-menu ()
  (setq display-buffer-alist
        (cons
         '("\\*Buffer List\\*"
           (display-buffer-same-window))
         display-buffer-alist))

  ;; (global-set-key (kbd "C-x C-b") 'buff-menu)
  )

(provide 'init-buff-menu)
